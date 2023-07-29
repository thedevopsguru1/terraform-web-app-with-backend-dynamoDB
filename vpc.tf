resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16" # Defines overall VPC address space
  
  tags = {
      Name = "VPC-2" # Tag VPC with name
  }
}
