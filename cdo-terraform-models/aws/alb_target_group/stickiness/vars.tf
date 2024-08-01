variable "name" {
  type        = string
  description = "A string representing the ALB target group name"
}

variable "port" {
  type        = number
  description = "A number representing the ALB target group port"
  default     = 80
}

variable "vpc_id" {
  type        = string
  description = "A string representing the VPC ID"
}

variable "health_check_path" {
  type        = string
  description = "A string representing the ALB target group health check path"
  default     = "/"
}

variable "health_check_matcher" {
  type        = string
  description = "A string representing the ALB target group health check matcher"
  default     = "200-399"
}

variable "health_check_timeout" {
  type        = number
  description = "A number representing the ALB target group health check timeout and interval (timeout * 2)"
  default     = 5
}

variable "stickiness_type" {
  type        = string
  description = "A string representing the stickiness type"
  default     = "lb_cookie"
}
