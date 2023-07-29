resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip-ip.id
  subnet_id     = aws_subnet.public-nat.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}