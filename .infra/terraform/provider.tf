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
      Project     = "Crunch"
      Team        = "MatFor"
      Repository  = "https://github.com/vshxp/challenge-crunch"
    }
  }
}

