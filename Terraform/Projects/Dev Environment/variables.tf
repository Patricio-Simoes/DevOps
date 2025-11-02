# AMI variables

variable "ami" {
  description = "Specifies the AMI id for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Specifies the EC2 instance type"
  type        = string
}

# Network variables

variable "project_name" {
  description = "Specifies the name of the current project"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Specifies the CIDR block of the main VPC subnet"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Specifies the CIDR block of the main VPC"
  type        = string
}