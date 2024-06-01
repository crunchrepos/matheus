module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs              = var.vpc_azs
  private_subnets  = var.vpc_private_subnets
  public_subnets   = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets
  enable_nat_gateway = var.vpc_enable_nat_gateway
  tags = var.tags
}

resource "aws_db_subnet_group" "default" {
  name       = "database-subnet-group"
  subnet_ids = module.vpc.database_subnets
  tags       = var.tags
}