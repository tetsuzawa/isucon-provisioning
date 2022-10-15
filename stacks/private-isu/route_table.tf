resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "isucon"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet-gateway.id

  depends_on = [aws_internet_gateway.internet-gateway]
}

resource "aws_route_table_association" "subnet-route-table-association" {
  route_table_id = aws_route_table.route-table.id
  subnet_id      = aws_subnet.subnet.id
}