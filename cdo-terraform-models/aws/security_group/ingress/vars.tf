variable "name" {
  type        = string
  description = "A string representing the security group name"
}

variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "description" {
  type        = string
  description = "A string representing the security group description"
}

variable "from_port" {
  type        = number
  description = "A number representing the security group ingress from port"
}

variable "to_port" {
  type        = number
  description = "A number representing the security group ingress to port"
}

variable "protocol" {
  description = "A string or number representing the security group ingress protocol"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "A list of strings representing VPC CIDR blocks for ingress rules"
  default     = null
}

variable "security_groups" {
  type        = list(string)
  description = "A list of strings representing security groups"
  default     = null
}
