variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "cidr_block" {
  type        = string
  description = "A string representing the route CIDR"
  default     = "0.0.0.0/0"
}

variable "nat_gateway_id" {
  type        = string
  description = "A string representing the route NAT gateway ID"
  default     = null
}

variable "gateway_id" {
  type        = string
  description = "A string representing the route gateway ID"
  default     = null
}

variable "name" {
  type        = string
  description = "A string representing the route table name"
}
