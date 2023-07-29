resource "aws_lb_target_group_attachment" "my_app_eg1" {
 
  depends_on = [aws_instance.web]
  target_group_arn = aws_lb_target_group.my_app_eg1.arn
  target_id        = aws_instance.web.id
  port             = 80
}