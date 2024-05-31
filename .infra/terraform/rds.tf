module "rds_postgres_db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.6.0"

  identifier = var.db_instance_name

  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_disk_size
  multi_az               = var.db_multi_az
  db_name                = var.db_database_name
  username               = var.db_username
  password               = data.aws_ssm_parameter.db_password.value
  port                   = var.db_postgres_port
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  monitoring_interval    = var.db_monitoring_interval
  monitoring_role_name   = var.db_monitoring_role_name
  create_monitoring_role = true
  create_db_subnet_group = true
  subnet_ids             = module.vpc.database_subnets
  major_engine_version   = var.db_engine_version
  deletion_protection    = var.db_enable_deletion_protection
  family                 = var.db_family
  manage_master_user_password	 = false
  tags = merge(var.tags, {
    Name = var.db_instance_name
  })
}