variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "A string representing the VPC CIDR"
}

variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "efs_subnets" {
  type        = list(string)
  description = "A list of strings representing ALB subnets"
}