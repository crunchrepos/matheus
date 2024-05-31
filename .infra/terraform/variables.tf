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

variable "db_password_parameter" {
  description = "The SSM parameter name for the database password"
  type        = string
}
