variable "workspace_to_environment_map" {
  type = map(string)
  default = {
    dev  = "dev"
    prod = "prod"
  }
}

variable "environment" {}
variable "aws_region" {}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_azs" {
  description = "The availability zones"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "vpc_database_subnets" {
  description = "List of database subnet CIDRs"
  type        = list(string)
}

variable "vpc_enable_nat_gateway" {
  description = "Enable or disable NAT gateway"
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}

# ------------> DATABASE <------------
variable "db_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "The engine for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}
variable "db_engine_version" {
  description = "The engine version for the RDS instance"
  type        = string
}

variable "db_instance_name" {
  description = "value of the db_instance_identifier"
  type        = string
}

variable "db_disk_size" {
  description = "The size of the disk for the RDS instance"
  type        = string
}

variable "db_multi_az" {
  description = "Enable or disable multi-AZ for the RDS instance"
  type        = bool
  default     = false
}

variable "db_database_name" {
  description = "The name of the database (NOT INSTANCE NAME)"
  type        = string
}

variable "db_postgres_port" {
  description = "The port for the RDS instance"
  type        = string
}

variable "db_monitoring_interval" {
  description = "The monitoring interval for the RDS instance (in seconds)"
  type        = string
}

variable "db_monitoring_role_name" {
  description = "The name of the monitoring role"
  type        = string 
}

variable "db_enable_deletion_protection" {
  description = "Enable or disable deletion protection for the RDS instance (false allows deletion of the RDS instance)"
  type        = bool
  default     = false
}

variable "db_family" {
  description = "The family of the RDS instance"
  type        = string
}
variable "db_username" {
  description = "The database username"
  type        = string
}

# ------------> SSM PARAMETERS <------------




# ------------> ECS <------------

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_autoscaling_min_size" {
  description = "The minimum size of the ECS autoscaling group"
  type        = number
}

variable "ecs_autoscaling_max_size" {
  description = "The maximum size of the ECS autoscaling group"
  type        = number
}


variable "ecr_allow_force_delete" {
  description = "Allow force deletion of the ECR repository"
  type        = bool
}
# ------------> ECS SERVICE <------------
variable "app_count_boilerplate" {
  description = "The number of instances to run"
  type        = string  
}

# ------------> APPLICATION <------------
variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "app_port" {
  description = "The port of the application"
  type        = string
}

variable "health_check_path" {
  description = "The path for the health check"
  type        = string
  default     = "/"
}

variable "app_container_cpu" {
  description = "The CPU for the application container"
  type        = string  
}

variable "app_container_memory" {
  description = "The memory for the application container"
  type        = string
}

variable "app_jwt_expiration" {
  description = "value of the jwt expiration"
  type        = string
}

# ------------> ECS TASK DEFINITION <------------
variable "ecs_fargate_cpu" {
  description = "The CPU for the ECS task definition"
  type        = string
}

variable "ecs_fargate_memory" {
  description = "The memory for the ECS task definition"
  type        = string
}