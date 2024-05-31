variable "workspace_to_environment_map" {
  type = map(string)
  default = {
    dev   = "dev"
    prod  = "prod"
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

variable "azs" {
  description = "The availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "database_subnets" {
  description = "List of database subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable or disable NAT gateway"
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Enable or disable VPN gateway"
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}
