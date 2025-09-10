module "vpc" {
  source        = "./modules/vpc"
  name_prefix   = local.name_prefix
  vpc_cidr      = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  region        = var.region
}

module "sg" {
  source      = "./modules/security_group"
  name_prefix = local.name_prefix
  vpc_id      = module.vpc.vpc_id
}

module "rds" {
  source            = "./modules/rds"
  name_prefix       = local.name_prefix
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  subnet_ids        = module.vpc.private_subnet_ids
  vpc_security_group_ids = [module.sg.rds_sg_id]
  multi_az          = var.multi_az
  region            = var.region
  backup_retention  = var.backup_retention
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
}
