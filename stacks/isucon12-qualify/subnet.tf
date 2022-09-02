resource "aws_subnet" "subnet" {
  cidr_block              = "192.168.0.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = local.tags
}