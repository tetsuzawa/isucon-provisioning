output "IP_BENCH" {
  value = module.benchmarker.public_ip
}

output "IP_A" {
  value = module.worker_1.public_ip
}

output "IP_B" {
  value = module.worker_2.public_ip
}

output "IP_C" {
  value = module.worker_3.public_ip
}

output "IP_D" {
  value = module.worker_4.public_ip
}

output "IP_E" {
  value = module.worker_5.public_ip
}
