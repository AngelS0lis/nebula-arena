terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
  backend "s3" {
    bucket         = "nebula-tfstate-906048429598"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nebula-tfstate-locks"
  }
}

provider "aws" {
  region = var.region
}
