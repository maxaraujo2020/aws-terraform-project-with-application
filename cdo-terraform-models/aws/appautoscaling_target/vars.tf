variable "max_capacity" {
  type        = number
  description = "A number representing the max number of containers"
  default     = 4
}

variable "min_capacity" {
  type        = number
  description = "A number representing the min number of containers"
  default     = 2
}

variable "cluster_name" {
  type        = string
  description = "A string representing the ECS cluster name"
}

variable "service_name" {
  type        = string
  description = "A string representing the ECS service name"
}
