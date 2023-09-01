terraform {
  backend "s3" { /* see Makefile for actual options */ }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Name                  = "isucon"
      terraform             = "true"
      aws-nuke-donot-delete = "true"
    }
  }
}

variable "key_name" {
  type = string
}

module "network" {
  source = "../modules/network"

  vpc_cidr_block           = "192.168.0.0/16"
  subnet_cidr_block        = "192.168.0.0/24"
  subnet_availability_zone = "ap-northeast-1c"
  tags                     = {}
}

#module "bench" {
#  source = "../modules/instance"
#
#  ami_id             = ""
#  instance_name      = "${local.name_prefix}_bench"
#  instance_type      = var.instance_type_benchmarker
#  key_name           = var.key_name
#  private_ip         = "192.168.0.10"
#  security_group_ids = [module.network.security_group_id]
#  subnet_id          = module.network.subnet_id
#  ebs_volume_size    = 50
#  tags               = local.tags
#}

module "isu_1" {
  source = "../modules/instance"

  ami_id             = "ami-0734085295d5c2e92"
  instance_name      = "isu_1"
  instance_type      = "c5.large"
  key_name           = var.key_name
  private_ip         = "192.168.0.11"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 16
  tags               = {}
}

module "isu_2" {
  source = "../modules/instance"

  ami_id             = "ami-0734085295d5c2e92"
  instance_name      = "isu_2"
  instance_type      = "c5.large"
  key_name           = var.key_name
  private_ip         = "192.168.0.12"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 16
  tags               = {}
}

module "isu_3" {
  source = "../modules/instance"

  ami_id             = "ami-0734085295d5c2e92"
  instance_name      = "isu_3"
  instance_type      = "c5.large"
  key_name           = var.key_name
  private_ip         = "192.168.0.13"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 16
  tags               = {}
}
