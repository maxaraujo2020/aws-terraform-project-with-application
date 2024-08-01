variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "cidr_block" {
  type        = string
  description = "A string representing the subnet CIDR block"
  default     = "10.0.0.0/24"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "A bool representing the public mapping on launch"
  default     = false
}

variable "availability_zone" {
  type        = string
  description = "A string representing the subnet availability zone.\nSample: 'us-east-1a'"
}

variable "name" {
  type        = string
  description = "A string representing the subnet name"
}
