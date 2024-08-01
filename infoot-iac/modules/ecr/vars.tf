variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "ecr_lifecycle_policy_count_number" {
  type        = number
  description = "A number representing the ECR lifecycle policy retention days"
}
