terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.9.0"
    }
  }
}


provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.environment
      Name        = "crunch"
    }
  }
}

