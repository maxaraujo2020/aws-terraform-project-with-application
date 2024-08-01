variable "name" {
  type        = string
  description = "A string representing the ECS cluster name"
}

variable "image" {
  type        = string
  description = "A string representing the image URL"
}

variable "container_port" {
  type        = number
  description = "A number representing the container port"
  default     = 80
}

variable "host_port" {
  type        = number
  description = "A number representing the host port"
  default     = 80
}

variable "memory" {
  type        = number
  description = "A number representing the container memory"
  default     = 512
}

variable "cpu" {
  type        = number
  description = "A number representing the container cpu"
  default     = 256
}

variable "execution_role_arn" {
  type        = string
  description = "A string representing the task execution role ARN"
}
