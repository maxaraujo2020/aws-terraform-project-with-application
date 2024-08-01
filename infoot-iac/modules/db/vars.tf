variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "db_subnet_group_subnet_ids" {
  type        = list(string)
  description = "A list of strings representing DB subnet group subnet IDs"
}

variable "db_instance_availability_zone" {
  type        = string
  description = "A string representing the DB instance availability zone"
}

variable "db_instance_name" {
  type        = string
  description = "A string representing the DB instance name"
}

variable "db_instance_port" {
  type        = number
  description = "A number representing the DB instance port"
}

variable "db_instance_username" {
  type        = string
  description = "A string representing the DB instance username"
}

variable "db_instance_vpc_security_group_ids" {
  type        = list(string)
  description = "A list of strings representing DB instance VPC security group IDs"
}
