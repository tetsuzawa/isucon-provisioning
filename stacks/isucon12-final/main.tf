terraform {
  backend "s3" { /* see Makefile for actual options */ }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      terraform      = "true"
      AutomationMeta = "isucon"
    }
  }
}

variable "key_name" {
  type    = string
  default = "aws_tetsuzawa"
}

module "network" {
  source = "../modules/network"

  vpc_cidr_block           = "192.168.0.0/16"
  subnet_cidr_block        = "192.168.0.0/24"
  subnet_availability_zone = "ap-northeast-1c"
  tags                     = {}
}

module "isu_bench" {
  source = "../modules/instance"

  ami_id             = "ami-0769691a5a9878f4e"
  instance_name      = "isu_bench"
  instance_type      = "c5.large"
  key_name           = var.key_name
  private_ip         = "192.168.0.10"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = {}
}

#module "isu_1" {
#  source = "../modules/instance"
#
#  ami_id             = "ami-0cdfc77a3464abc4c"
#  instance_name      = "isu_1"
#  instance_type      = "c5.large"
#  key_name           = var.key_name
#  private_ip         = "192.168.0.11"
#  security_group_ids = [module.network.security_group_id]
#  subnet_id          = module.network.subnet_id
#  ebs_volume_size    = 50
#  tags               = {}
#}

#module "isu_2" {
#  source = "../modules/instance"
#
#  ami_id             = "ami-0cdfc77a3464abc4c"
#  instance_name      = "isu_2"
#  instance_type      = "c5.large"
#  key_name           = var.key_name
#  private_ip         = "192.168.0.12"
#  security_group_ids = [module.network.security_group_id]
#  subnet_id          = module.network.subnet_id
#  ebs_volume_size    = 50
#  tags               = {}
#}
#
#module "isu_3" {
#  source = "../modules/instance"
#
#  ami_id             = "ami-0cdfc77a3464abc4c"
#  instance_name      = "isu_3"
#  instance_type      = "c5.large"
#  key_name           = var.key_name
#  private_ip         = "192.168.0.13"
#  security_group_ids = [module.network.security_group_id]
#  subnet_id          = module.network.subnet_id
#  ebs_volume_size    = 50
#  tags               = {}
#}

module "isu_4" {
  source = "../modules/instance"

  ami_id             = "ami-0590df6180d27d2ea"
  instance_name      = "isu_4"
  instance_type      = "c5.large"
  key_name           = var.key_name
  private_ip         = "192.168.0.14"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = {}
}

#module "isu_5" {
#  source = "../modules/instance"
#
#  ami_id             = "ami-0cdfc77a3464abc4c"
#  instance_name      = "isu_5"
#  instance_type      = "c5.large"
#  key_name           = var.key_name
#  private_ip         = "192.168.0.15"
#  security_group_ids = [module.network.security_group_id]
#  subnet_id          = module.network.subnet_id
#  ebs_volume_size    = 50
#  tags               = {}
#}
