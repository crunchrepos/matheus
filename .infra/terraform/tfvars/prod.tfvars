aws_region                    = "us-east-2"

vpc_name                      = "fornazieri-crunch-prod"
vpc_cidr                      = "10.0.0.0/16"
vpc_azs                       = ["us-east-2a", "us-east-2b", "us-east-2c"]
vpc_public_subnets            = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_private_subnets           = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
vpc_database_subnets          = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
vpc_enable_nat_gateway        = true

db_username                   = "IamTheUsername"
db_password_parameter         = "/dev/crunch/db/password"
db_instance_class             = "db.t4g.micro"
db_engine_version             = "16.2"
db_engine                     = "postgres"
db_storage_type               = "gp2"
db_multi_az                   = false
db_disk_size                  = 20
db_instance_name              = "crunch"
db_database_name              = "crunch"
db_postgres_port              = 5432
db_monitoring_interval        = 60
db_monitoring_role_name       = "rds-monitoring-role"
db_enable_deletion_protection = false
db_family                     = "postgres16"
ecr_allow_force_delete        = true
tags = {
  Terraform   = "true"
  Environment = "prod"
}
