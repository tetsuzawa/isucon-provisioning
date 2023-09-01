module "network" {
  source = "../modules/network"

  vpc_cidr_block           = "192.168.0.0/16"
  subnet_cidr_block        = "192.168.0.0/24"
  subnet_availability_zone = "ap-northeast-1c"
  tags                     = local.tags
}

module "benchmarker" {
  source = "../modules/instance"

  ami_id             = var.ami_id_benchmarker
  instance_name      = "benchmarker"
  instance_type      = var.instance_type_benchmarker
  key_name           = var.key_name
  private_ip         = "192.168.0.10"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}

module "worker_1" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_1
  instance_name      = "worker-1"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "192.168.0.11"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}

module "worker_2" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_2
  instance_name      = "worker-2"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "192.168.0.12"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}


module "worker_3" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_3
  instance_name      = "worker-3"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "192.168.0.13"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}


module "worker_4" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_4
  instance_name      = "worker-4"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "192.168.0.14"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}

module "worker_5" {
  source = "../modules/instance"

  ami_id             = var.ami_id_worker_5
  instance_name      = "worker-5"
  instance_type      = var.instance_type_worker
  key_name           = var.key_name
  private_ip         = "192.168.0.15"
  security_group_ids = [module.network.security_group_id]
  subnet_id          = module.network.subnet_id
  ebs_volume_size    = 50
  tags               = local.tags
}
