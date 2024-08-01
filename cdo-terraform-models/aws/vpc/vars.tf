variable "cidr_block" {
  type        = string
  description = "A string representing the CIDR block"
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type        = bool
  description = "A bool representing the VPC DNS support"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A bool representing the VPC DNS hostnames support"
  default     = false
}

variable "name" {
  type        = string
  description = "A string representing the VPC name"
}
