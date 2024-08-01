variable "repository" {
  type        = string
  description = "A string representing the ECR repository name"
}

variable "rule_priority" {
  type        = number
  description = "A number representing the ECR lifecycle policy rule priority"
}

variable "description" {
  type        = string
  description = "A string representing the ECR lifecycle policy description"
}

variable "count_number" {
  type        = number
  description = "A number representing the ECR lifecycle policy maximum number of images"
}
