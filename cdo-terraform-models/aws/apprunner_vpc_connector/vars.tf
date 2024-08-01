variable "vpc_connector_name" {
  type        = string
  description = "A string representing the VPC connector name"
}

variable "subnets" {
  type        = list(string)
  description = "A list of strings representing subnet IDs"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of strings representing security groups IDs to be respectively under subnets"
}
