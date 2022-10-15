output "instance_id" {
  value = aws_spot_instance_request.spot_instance.id
}

output "public_ip" {
  value = aws_spot_instance_request.spot_instance.public_ip
}
