# PUBLIC ROUTE 
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.example.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags = {
      Name = "Public route table"
  }
}

# NAT ROUTE 
resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
   tags = {
      Name = " route table to NAT"
  }
}