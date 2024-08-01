variable "name" {
  type        = string
  description = "A string representing the ALB target group name"
}

variable "port" {
  type        = number
  description = "A number representing the ALB target group port"
  default     = 80
}

variable "target_type" {
  type        = string
  description = "A string representing the ALB target type"
  default     = "ip"
}

variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "A number representing the ALB target group health check healthy threshold in seconds"
  default     = 2
}

variable "health_check_interval" {
  type        = number
  description = "A number representing the ALB target group health check interval in seconds"
  default     = 30
}

variable "health_check_path" {
  type        = string
  description = "A string representing the ALB target group health check path"
  default     = "/"
}

variable "health_check_timeout" {
  type        = number
  description = "A number representing the ALB target group health check timeout in seconds"
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "A number representing the ALB target group health check unhealthy threshold in seconds"
  default     = 2
}
