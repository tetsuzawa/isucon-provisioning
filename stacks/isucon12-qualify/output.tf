output "bench-public-ip" {
  value = aws_eip.bench.public_ip
}

output "instance-1-public-ip" {
  value = aws_eip.instance-1.public_ip
}

output "instance-2-public-ip" {
  value = aws_eip.instance-2.public_ip
}

output "instance-3-public-ip" {
  value = aws_eip.instance-3.public_ip
}
