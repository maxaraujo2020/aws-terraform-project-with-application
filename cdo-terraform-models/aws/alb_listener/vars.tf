variable "load_balancer_arn" {
  type        = string
  description = "A string representing the load balancer ARN"
}

variable "port" {
  type        = number
  description = "A number representing the port"
  default     = 80
}

variable "target_group_arn" {
  type        = string
  description = "A string representing the target group ARN"
}

variable "name" {
  type        = string
  description = "A string representing the VPC name"
}

variable "certificate_arn" {
  type        = string
  description = "A string representing the certificate"
}

variable "fqdn_list" {
  type        = list(string)
  description = "List string representing the fqdn (DNS)"
}

variable "path_pattern" {
  type        = list(string)
  description = "List string representing the path_pattern exp /*"
}
