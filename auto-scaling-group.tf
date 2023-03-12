#Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
   
  name              = "my_asg"
  max_size          = 3
  min_size          = 1
  health_check_type = "ELB"
  desired_capacity  = 2
  target_group_arns = [aws_lb_target_group.target_g.arn]

  vpc_zone_identifier = element(aws_subnet.public.*.id,count.index)

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}