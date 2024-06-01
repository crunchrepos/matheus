aws_region                    = "us-east-1"

vpc_name                      = "fornazieri-crunch-dev"
vpc_cidr                      = "10.0.0.0/16"
vpc_azs                       = ["us-east-1a"]
vpc_public_subnets            = ["10.0.1.0/24"]
vpc_private_subnets           = ["10.0.101.0/24"]
vpc_database_subnets          = ["10.0.201.0/24"]
vpc_enable_nat_gateway        = true

db_username                    = "white"
db_password_parameter         = "/dev/crunch/db/password"
db_instance_class             = "db.t4g.micro"
db_engine_version             = "16.2"
db_engine                     = "postgres"
db_storage_type               = "gp2"
db_multi_az                   = false
db_disk_size                  = 20
db_instance_name              = "crunch"
db_database_name              = "boilerplate"
db_postgres_port              = 5432
db_monitoring_interval        = 60
db_monitoring_role_name       = "rds-monitoring-role"
db_enable_deletion_protection = false
db_family                     = "postgres16"
ecr_allow_force_delete        = true
tags = {
  Terraform   = "true"
  Environment = "dev"
}
ecs_autoscaling_min_size      = 1
ecs_autoscaling_max_size      = 3