variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}