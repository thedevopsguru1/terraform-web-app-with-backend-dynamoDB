# ROUTE ASSOCIATION FOR IGW
resource "aws_route_table_association" "bastion" {
  subnet_id = "${aws_subnet.public-bastion.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "nat" {
  subnet_id = "${aws_subnet.public-nat.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "lb" {
  subnet_id = "${aws_subnet.lb.id}"
  route_table_id = "${aws_route_table.public.id}"
}

# ROUTE ASSOCIATION FOR NAT
resource "aws_route_table_association" "web" {
  subnet_id = "${aws_subnet.private-web.id}"
  route_table_id = "${aws_route_table.nat.id}"
}