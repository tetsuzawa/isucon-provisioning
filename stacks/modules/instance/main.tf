resource "aws_instance" "instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile        = ""
  user_data                   = <<-EOF
                                    #!/bin/bash
                                    set -eux
                                    echo "setting up ssh..."
                                    sed -i -r -e "s/.*PubkeyAuthentication\s(yes|no)/PubkeyAuthentication yes/" /etc/ssh/sshd_config
                                    sed -i -r -e "s/.*AllowAgentForwarding\s(yes|no)/AllowAgentForwarding yes/" /etc/ssh/sshd_config
                                    systemctl restart sshd
                                    mkdir -p /home/${var.ssh_user_name}/.ssh
                                    ${join("\n", formatlist(format("curl -s https://github.com/%%s.keys >> /home/%s/.ssh/authorized_keys", var.ssh_user_name), var.github_ids))}
                                    chown -R ${var.ssh_user_name}:${var.ssh_user_name} /home/${var.ssh_user_name}/.ssh
                                    echo "ssh setup done"
                                    EOF

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.ebs_volume_size
    volume_type = "gp3"
  }

  tags = merge({
    Name = var.instance_name
  }, var.tags)
}

resource "aws_eip" "instance" {
  instance = aws_instance.instance.id
  vpc      = true
}
