#This target group forwrds traffic to the Load Balancer
resource "aws_lb_target_group" "target_g" {
  name        = "target-g"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
}