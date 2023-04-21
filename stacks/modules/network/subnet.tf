resource "aws_subnet" "subnet" {
  cidr_block              = var.subnet_cidr_block
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = true

  tags = var.tags
}