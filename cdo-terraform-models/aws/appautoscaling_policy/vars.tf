variable "name" {
  type        = string
  description = "A string representing the application autoscaling policy name"
}

variable "cluster_name" {
  type        = string
  description = "A string representing the ECS cluster name"
}

variable "service_name" {
  type        = string
  description = "A string representing the ECS service name"
}

variable "scalable_dimension" {
  type        = string
  description = "A string representing the application autoscaling target scalable dimension"
}

variable "service_namespace" {
  type        = string
  description = "A string representing the application autoscaling target service namespace"
}
