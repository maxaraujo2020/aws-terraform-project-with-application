variable "container_definitions_path" {
  type        = string
  description = "A string representing the ECS task definition container_definitions.json absolute path"
}

variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "alb_security_groups" {
  type        = list(string)
  description = "A list of strings representing ALB security groups"
}

variable "alb_subnets" {
  type        = list(string)
  description = "A list of strings representing ALB subnets"
}

variable "alb_target_group_vpc_id" {
  type        = string
  description = "A string representing ALB target group VPC ID"
}

variable "listener_port" {
  type        = number
  description = "A string representing the listener port"
}

variable "fqdn_list" {
  type        = list(string)
  description = "A list of strings representing fqdn"
}

variable "path_pattern" {
  type        = list(string)
  description = "A list of strings representing path pattern"
}

variable "certificate_arn" {
  type        = string
  description = "A string representing the certificate_arn"
}
