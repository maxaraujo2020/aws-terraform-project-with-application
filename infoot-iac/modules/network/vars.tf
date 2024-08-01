variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "availability_zones_count" {
  type        = number
  description = "A number representing the availability zones count"
  default     = 2
}

variable "vpc_cidr_block" {
  type        = string
  description = "A string representing the VPC CIDR"
}
