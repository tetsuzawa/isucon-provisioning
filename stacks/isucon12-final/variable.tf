variable "key_name" {
  type = string
}

variable "ami_id_benchmarker" {
  type    = string
  default = "ami-00acaccebe03b5bed"
}

variable "ami_id_worker_1" {
  type    = string
  default = "ami-00acaccebe03b5bed"
}

variable "ami_id_worker_2" {
  type    = string
  default = "ami-00acaccebe03b5bed"
}

variable "ami_id_worker_3" {
  type    = string
  default = "ami-00acaccebe03b5bed"
}

#variable "spot_price_benchmarker" {
#  type = string
#  // spot price 0.084700
#  default = "0.100"
#}
#
#variable "spot_price_worker" {
#  type = string
#  // spot price 0.034900
#  default = "0.050"
#}

variable "instance_type_benchmarker" {
  type    = string
  default = "c5.xlarge"
}

variable "instance_type_worker" {
  type    = string
  default = "c5.large"
}
