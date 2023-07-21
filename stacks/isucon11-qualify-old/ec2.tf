variable "isucon11-qualify-ami-id" {
  type    = string
  default = "ami-0796be4f4814fc3d5"
}

variable "isucon11-qualify-bench-spot-price" {
  type    = string
  default = "0.090"
}

variable "isucon11-qualify-instance-spot-price" {
  type    = string
  default = "0.040"
}

resource "aws_spot_instance_request" "bench" {
  ami                            = var.isucon11-qualify-ami-id
  spot_price                     = var.isucon11-qualify-bench-spot-price
  instance_type                  = "c5.xlarge"
  spot_type                      = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment           = true

  security_groups             = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = "192.168.0.10"
  key_name                    = var.key_pair_name_isucon
  associate_public_ip_address = true

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "isucon-bench"
  }
}

resource "aws_ec2_tag" "bench" {
  key         = "Name"
  resource_id = aws_spot_instance_request.bench.spot_instance_id
  value       = "isucon-bench"
}

resource "aws_spot_instance_request" "instance-1" {
  ami                            = var.isucon11-qualify-ami-id
  spot_price                     = var.isucon11-qualify-instance-spot-price
  instance_type                  = "c5.large"
  spot_type                      = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment           = true

  security_groups             = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = "192.168.0.11"
  key_name                    = var.key_pair_name_isucon
  associate_public_ip_address = true

  tags = {
    Name = "isucon-instance"
    Num  = "1"
  }
}

resource "aws_ec2_tag" "instance-1" {
  key         = "Name"
  resource_id = aws_spot_instance_request.instance-1.spot_instance_id
  value       = "isucon-instance-1"
}

resource "aws_spot_instance_request" "instance-2" {
  ami                            = var.isucon11-qualify-ami-id
  spot_price                     = var.isucon11-qualify-instance-spot-price
  instance_type                  = "c5.large"
  spot_type                      = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment           = true

  security_groups             = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = "192.168.0.12"
  key_name                    = var.key_pair_name_isucon
  associate_public_ip_address = true

  tags = {
    Name = "isucon-instance"
    Num  = "2"
  }
}

resource "aws_ec2_tag" "instance-2" {
  key         = "Name"
  resource_id = aws_spot_instance_request.instance-2.spot_instance_id
  value       = "isucon-instance-2"
}

resource "aws_spot_instance_request" "instance-3" {
  ami                            = var.isucon11-qualify-ami-id
  spot_price                     = var.isucon11-qualify-instance-spot-price
  instance_type                  = "c5.large"
  spot_type                      = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment           = true

  security_groups             = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.subnet.id
  private_ip                  = "192.168.0.13"
  key_name                    = var.key_pair_name_isucon
  associate_public_ip_address = true

  tags = {
    Name = "isucon-instance"
    Num  = "3"
  }
}

resource "aws_ec2_tag" "instance-3" {
  key         = "Name"
  resource_id = aws_spot_instance_request.instance-3.spot_instance_id
  value       = "isucon-instance-3"
}
