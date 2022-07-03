output "bench-public-ip" {
  value = aws_spot_instance_request.bench.public_ip
}

output "instance-1-public-ip" {
  value = aws_spot_instance_request.instance-1.public_ip
}

#output "instance-2-public-ip" {
#  value = aws_spot_instance_request.instance-2.public_ip
#}
#
#output "instance-3-public-ip" {
#  value = aws_spot_instance_request.instance-3.public_ip
#}
