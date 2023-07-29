resource "aws_security_group" "sg-web" {
    name = "SG-web"
    vpc_id = aws_vpc.example.id
    description = "Security group for web"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        security_groups = ["${aws_security_group.SG-bastionhosts.id}"]
        description = "Allow incoming SSH traffic from bastion hosts"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups = ["${aws_security_group.SG-loadbalancer.id}"]
      #  cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH traffic from bastion hosts"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        security_groups = ["${aws_security_group.SG-loadbalancer.id}"]
       # cidr_blocks = ["0.0.0.0/0"]
        description = "Allow incoming SSH traffic from bastion hosts"
    }
    egress {
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "-1"
      description = "Allow all outgoing traffic"
  }
    tags = {
        Name = "SG-web"
    }
}