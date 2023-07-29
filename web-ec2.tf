resource "aws_instance" "web" {
    ami = "ami-0cc87e5027adcdca8"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.private-web.id}"
    key_name = "anael1"
    depends_on = [aws_lb.my_app_eg1]
    vpc_security_group_ids = ["${aws_security_group.sg-web.id}"]
    user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                systemctl start httpd
                systemctl enable httpd
                echo "Hello World!" > /var/www/html/index.html
                EOF
    user_data_replace_on_change = true            
    tags = {
        Name = "Web_ec2"
       
    }
}
