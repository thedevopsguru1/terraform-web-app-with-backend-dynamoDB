resource "aws_launch_template" "my_app_eg1" {
  name                   = "my-app-eg2-autoscalling"
  image_id               = "ami-0cc87e5027adcdca8"
  instance_type = "t2.micro"
  key_name               = "anael1"
  vpc_security_group_ids = [aws_security_group.sg-web.id]
  placement {
    availability_zone = "us-east-2c"
  }
  depends_on = [aws_lb.my_app_eg1]
  # Base 64 code for the commands below
  user_data = <<-EOF
                IyEvYmluL2Jhc2gKICAgICAgICAgICAgICAgeXVtIGluc3RhbGwgaHR0cGQgLXkKICAgICAgICAgICAgICAgc3lzdGVtY3RsIHN0YXJ0IGh0dHBkCiAgICAgICAgICAgICAgIHN5c3RlbWN0bCBlbmFibGUgaHR0cGQKICAgICAgICAgICAgICAgZWNobyAiSGVsbG8sIFdvcmxkIiA+IC92YXIvd3d3L2h0bWwvaW5kZXguaHRtbA==
                EOF
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
}