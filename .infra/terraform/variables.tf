variable "workspace_to_environment_map" {
  type = map(string)
  default = {
    dev   = "dev"
    prod  = "prod"
  }
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "profile" {
  type        = string
  description = "AWS Profile"
  default     = "default"
}

variable "environment" {}
