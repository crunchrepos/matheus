terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.52.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "Crunch"
      Team        = "MatFor"
      Repository  = "https://github.com/vshxp/challenge-crunch"
    }
  }
}

