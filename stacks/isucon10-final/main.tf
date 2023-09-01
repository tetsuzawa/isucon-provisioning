module "network" {
  source = "../modules/network"

  vpc_cidr_block           = "10.160.0.0/16"
  subnet_cidr_block        = "10.160.1.0/24"
  subnet_availability_zone = "ap-northeast-1c"
  tags                     = local.tags
}

module "benchmarker" {
  source = "../modules/instance"

  ami_id             = var.ami_id_benchmarker
  instance_name      = "benchmarker"
  instance_type      = var.instance_type_benchmarker
  key_name           = var.key_name
  private_ip         = "10.160.1.104"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 30
  tags               = local.tags
}

module "worker_1" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_1
  instance_name      = "worker-1"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "10.160.1.101"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 30
  tags               = local.tags
}

module "worker_2" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_2
  instance_name      = "worker-2"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "10.160.1.102"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 30
  tags               = local.tags
}

module "worker_3" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_3
  instance_name      = "worker-3"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "10.160.1.103"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 30
  tags               = local.tags
}
