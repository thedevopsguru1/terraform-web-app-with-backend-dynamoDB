
resource "aws_autoscaling_group" "my_app_eg1" {
  name     = "my-app-eg1"
  min_size = 1
  max_size = 3

  health_check_type = "EC2"

  vpc_zone_identifier = [
    aws_subnet.private-web.id
  ]

  target_group_arns = [aws_lb_target_group.my_app_eg1.arn]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.my_app_eg1.id
      }
      override {
        instance_type = "t3.micro"
      }
    }
  }
}