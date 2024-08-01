variable "name" {
  type        = string
  description = "A string representing the ALB name"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of strings representing security groups"
}

variable "subnets" {
  type        = list(string)
  description = "A list of strings representing subnets"
}


