resource "aws_spot_instance_request" "spot_instance" {
  ami                            = var.ami_id
  spot_price                     = var.spot_price
  instance_type                  = var.instance_type
  spot_type                      = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment           = true
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

resource "aws_ec2_tag" "spot_instance" {
  key         = "Name"
  resource_id = aws_spot_instance_request.spot_instance.spot_instance_id
  value       = var.instance_name
}

resource "aws_eip" "spot_instance" {
  instance = aws_spot_instance_request.spot_instance.spot_instance_id
  vpc      = true
}
