resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.example.id
  tags = {
      Name = "my-igw2"
  }
}