variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
