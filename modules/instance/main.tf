resource "aws_instance" "instance" {
  ami                            = var.ami_id
  instance_type                  = var.instance_type
  security_groups                = var.security_group_ids
  subnet_id                      = var.subnet_id
  private_ip                     = var.private_ip
  key_name                       = var.key_name
  associate_public_ip_address    = true

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
    volume_type = "gp3"
  }

  tags = var.tags
}

resource "aws_ec2_tag" "instance" {
  key         = "Name"
  resource_id = aws_instance.instance.id
  value       = var.instance_name
}

resource "aws_eip" "instance" {
  instance = aws_instance.instance.id
  vpc      = true
}
