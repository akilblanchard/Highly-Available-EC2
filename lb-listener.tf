#listner ports for load balancer

resource "aws_lb_listener" "my_balancer" {
  load_balancer_arn = aws_lb.my_balancer.arn
  port              = "80"
  protocol          = "Http"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_g.arn
  }
}