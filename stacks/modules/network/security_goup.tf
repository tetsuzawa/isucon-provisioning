resource "aws_security_group" "security_group" {
  name   = "isucon"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5555
    protocol    = "tcp"
    to_port     = 5555
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7000
    protocol    = "tcp"
    to_port     = 7000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9292
    protocol    = "tcp"
    to_port     = 9292
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 50051
    protocol    = "tcp"
    to_port     = 50051
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}