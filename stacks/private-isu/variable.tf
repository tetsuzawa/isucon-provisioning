variable "key-pair" {
  type = string
}

variable "ami-id-benchmarker" {
  type    = string
  default = "ami-024cfcacc753fa53e"
}

variable "ami-id-worker-1" {
  type    = string
  default = "ami-06c39e451ff9930db"
}

variable "ami-id-worker-2" {
  type    = string
  default = "ami-06c39e451ff9930db"
}

variable "ami-id-worker-3" {
  type    = string
  default = "ami-06c39e451ff9930db"
}

variable "spot-price-benchmarker" {
  type    = string
  // spot price 0.084700
  default = "0.100"
}

variable "spot-price-instance" {
  type    = string
  // spot price 0.034900
  default = "0.050"
}

variable "instance-type-benchmarker" {
  type    = string
  default = "c6i.xlarge"
}

variable "instance-type-worker" {
  type    = string
  default = "c6i.large"
}
