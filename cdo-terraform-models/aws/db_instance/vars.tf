variable "identifier" {
  type        = string
  description = "A string representing the RDS name"
}

variable "engine" {
  type        = string
  description = "A string representing the RDS engine"
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  description = "A string representing the RDS engine version"
  default     = "14"
}

variable "instance_class" {
  type        = string
  description = "A string representing the RDS instance class"
  default     = "db.t3.micro"
}

variable "availability_zone" {
  type        = string
  description = "A string representing the RDS availability zone"
}

variable "allocated_storage" {
  type        = number
  description = "A number representing the RDS allocated storage"
  default     = 10
}

variable "max_allocated_storage" {
  type        = number
  description = "A number representing the RDS max allocated storage for autoscaling"
  default     = null
}

variable "db_name" {
  type        = string
  description = "A string representing the RDS database name"
}

variable "username" {
  type        = string
  description = "A string representing the RDS master database username"
}

variable "password" {
  type        = string
  description = "A string representing the RDS master database password"
  sensitive   = true
}

variable "port" {
  type        = number
  description = "A number representing the RDS database port"
}

variable "db_subnet_group_id" {
  type        = string
  description = "A string representing the RDS subnet group ID"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of strings representing VPC security groups IDs"
}
