#Auto Scaling Group
resource "aws_autoscaling_group" "asg" {

  name              = "my_asg"
  max_size          = 3
  min_size          = 1
  health_check_type = "ELB"
  desired_capacity  = 2
  target_group_arns = [aws_lb_target_group.target_g.arn]

  vpc_zone_identifier = element(aws_subnet.public.*.id, count.index)

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}

#AutoScaling Policy

#ScaleUpPolicy

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"   #adds one instance
  cooldown               = "300" #cooldown period after scaling

}

#Scale up Cloud Watch alarm
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = "scale-up-alarm"
  alarm_description   = "asg-scale-up-cpu-alert"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "50"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my_asg.na
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_up.arn]
}