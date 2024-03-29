resource "aws_internet_gateway" "internet-gateway" {
  tags = var.tags
}

resource "aws_internet_gateway_attachment" "internet-gateway-attachment" {
  internet_gateway_id = aws_internet_gateway.internet-gateway.id
  vpc_id              = aws_vpc.vpc.id
}