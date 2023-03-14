#Application Load Balancer

resource "aws_lb" "my_balancer" {
  name               = "my-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_security.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id, aws_subnet.public_c.id]
}



#listner ports for load balancer

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.my_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_g.arn
  }
}