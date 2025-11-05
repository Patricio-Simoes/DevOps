module "network" {
  source = "./modules/network"

  subnet_cidr_block = var.subnet_cidr_block
  vpc_cidr_block    = var.vpc_cidr_block

  project_name = var.project_name
}

module "compute" {
  source = "./modules/compute"

  ami           = var.ami
  project_name  = var.project_name
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  vpc_id        = module.network.vpc_id
}