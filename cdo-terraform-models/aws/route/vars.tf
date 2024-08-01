variable "route_table_id" {
  type        = string
  description = "A string representing the VPC main route table ID"
}

variable "destination_cidr_block" {
  type        = string
  description = "A string representing the destination CIDR"
  default     = "0.0.0.0/0"
}

variable "gateway_id" {
  type        = string
  description = "A string representing the internet gateway ID"
}
