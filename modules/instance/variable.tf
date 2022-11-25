variable "instance_name" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "security_group_ids" { type = list(string) }
variable "subnet_id" { type = string }
variable "private_ip" { type = string }
variable "key_name" { type = string }
variable "tags" { type = map(any) }
