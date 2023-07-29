resource "aws_lb" "my_app_eg1" {
  name               = "my-app-eg1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG-loadbalancer.id]

  # access_logs {
  #   bucket  = "my-logs"
  #   prefix  = "my-app-lb"
  #   enabled = true
  # }
  # adding the next line only for scalling or autoscalling
  
  subnets = [
    aws_subnet.public-bastion.id,
    aws_subnet.lb.id
  ]
 # depends_on = [aws_instance.web]
}