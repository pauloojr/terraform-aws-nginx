terraform {
  required_version = ">= 1.5"

backend "s3" {
  bucket         = "pauloojr-terraform-state-dev"
  key            = "terraform-aws-nginx/dev/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "terraform-locks"
  encrypt        = true
}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "security_group" {
  source = "../../modules/security-group"

  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "ec2" {
  source = "../../modules/ec2"

  environment       = var.environment
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  instance_type     = var.instance_type
}

