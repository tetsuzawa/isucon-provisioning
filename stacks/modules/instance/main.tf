resource "aws_instance" "instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile        = ""

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.ebs_volume_size
    volume_type = "gp3"
  }

  tags = merge({
    Name           = var.instance_name
  }, var.tags)
}

resource "aws_eip" "instance" {
  instance = aws_instance.instance.id
  vpc      = true
}


#data "template_cloudinit_config" "user_data" {
#    part {
#        content_type = "text/cloud-config"
#        content      = <<EOT
#users:
#  - name: isucon
#    ssh_import_id
#
#EOT
#    }
#}