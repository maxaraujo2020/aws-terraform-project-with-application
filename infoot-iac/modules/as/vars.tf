variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "iam_instance_profile_role" {
  type        = string
  description = "A string representing IAM instance profile role name"
}

variable "launch_configuration_security_groups" {
  type        = list(string)
  description = "A list of string representing launch configuration security groups"
}

variable "launch_configuration_user_data" {
  type        = string
  description = "A string representing launch configuration user data"
}

variable "autoscaling_group_target_group_arns" {
  type        = list(string)
  description = "A list of string representing the autoscaling group ALB target group ARN"
}

variable "autoscaling_group_vpc_zone_identifier" {
  type        = list(string)
  description = "A list of string representing the autoscaling group VPC zone identifier subnet ID"
}
