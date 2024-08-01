variable "name" {
  type        = string
  description = "A string representing the ECS service name"
}

variable "cluster" {
  type        = string
  description = "A string representing the ECS cluster ID"
}

variable "task_definition" {
  type        = string
  description = "A string representing the task definition ARN"
}

variable "desired_count" {
  type        = number
  description = "A number representing the number of containers"
  default     = 3
}

variable "subnets" {
  type        = list(string)
  description = "A list of strings representing subnets"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of strings representing security groups"
}

variable "target_group_arn" {
  type        = string
  description = "A string representing the ALB target group ARN"
}

variable "container_port" {
  type        = number
  description = "A number representing the container port"
  default     = 80
}
