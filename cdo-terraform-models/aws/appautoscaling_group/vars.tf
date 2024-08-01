variable "desired_capacity" {
  type        = number
  description = "A number representing the desired capacity"
  default     = 1
}

variable "launch_configuration" {
  type        = string
  description = "A string representing the launch configuration name"
}

variable "max_size" {
  type        = number
  description = "A number representing the max size capacity"
  default     = 2
}

variable "min_size" {
  type        = number
  description = "A number representing the min size capacity"
  default     = 1
}

variable "name" {
  type        = string
  description = "A string representing the autoscaling group name"
}

variable "target_group_arns" {
  type        = list(string)
  description = "A list of string representing the ALB target group ARN"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "A list of string representing the VPC zone identifier subnet ID"
}
