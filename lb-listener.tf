resource "aws_lb_listener" "http_eg1" {
  load_balancer_arn = aws_lb.my_app_eg1.arn
  port              = "80"
  protocol          = "HTTP"

  #default_action {
  #  type             = "forward"
  #  target_group_arn = aws_lb_target_group.my_app_eg1.arn
  #}
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  
}

resource "aws_lb_listener" "my_app_eg2_tls" {
  load_balancer_arn = aws_lb.my_app_eg1.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.api.arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_app_eg1.arn
  }

  depends_on = [aws_acm_certificate_validation.api]
}