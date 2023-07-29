resource "aws_security_group" "SG-bastionhosts" {
  name = "SG-bastionhosts"
  vpc_id = aws_vpc.example.id
  description = "Security group for bastion hosts"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow incoming SSH from management IPs"
  }

 
  egress {
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "-1"
      description = "Allow all outgoing traffic"
  }
  tags = {
      Name = "SG-bastionhosts"
  }
}
