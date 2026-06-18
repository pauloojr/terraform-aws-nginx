variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be created"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID attached to the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
