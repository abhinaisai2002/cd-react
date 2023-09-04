
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "abhinai-ci-cd-terraform-remote-state"
    key = "dev/project-1-ci-cd/terraform.tfstate"
    region = "ap-south-1"
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
  shared_config_files = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
