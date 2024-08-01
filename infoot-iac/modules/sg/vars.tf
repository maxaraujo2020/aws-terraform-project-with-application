variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "listener_port" {
  type        = number
  description = "A string representing the listener port"
}

variable "security_group_db_port" {
  type        = number
  description = "A number representing the security group DB egress from/to port"
}

variable "security_groups_vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "db_cidr_blocks" {
  type        = list(string)
  description = "CIRD"
}
