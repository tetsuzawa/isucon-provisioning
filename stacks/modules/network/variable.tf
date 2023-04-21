variable "vpc_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "subnet_cidr_block" {
  type    = string
  default = "192.168.0.0/24"
}

variable "subnet_availability_zone" {
  type    = string
  default = "ap-northeast-1c"
}

variable "tags" { type = map(any) }
