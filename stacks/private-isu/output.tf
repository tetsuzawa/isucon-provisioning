output "IP_BENCH" {
  value = aws_eip.bench.public_ip
}

output "IP_A" {
  value = aws_eip.instance-1.public_ip
}

#output "IP_B" {
#  value = aws_eip.instance-2.public_ip
#}
#
#output "IP_C" {
#  value = aws_eip.instance-3.public_ip
#}
