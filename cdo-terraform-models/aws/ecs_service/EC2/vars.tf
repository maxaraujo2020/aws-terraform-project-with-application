variable "name" {
  type        = string
  description = "A string representing the ECS service name"
}

variable "cluster" {
  type        = string
  description = "A string representing the ECS cluster ID"
}

variable "desired_count" {
  type        = number
  description = "A number representing the number of containers"
  default     = 1
}

variable "task_definition" {
  type        = string
  description = "A string representing the task definition ARN"
}

variable "load_balancer_target_group_arn" {
  type        = string
  description = "A string representing the ALB target group ARN"
}

variable "container_name" {
  type        = string
  description = "A string representing the container name"
}

variable "load_balancer_container_port" {
  type        = number
  description = "A number representing the container port for ALB"
}
