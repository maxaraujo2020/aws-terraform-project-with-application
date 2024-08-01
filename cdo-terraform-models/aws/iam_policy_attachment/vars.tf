variable "name" {
  type        = string
  description = "A string representing the IAM policy name"
}

variable "roles" {
  type        = list(string)
  description = "A list of strings representing the IAM role ARN"
}

variable "policy_arn" {
  type        = string
  description = "A string representing the IAM policy ARN"
}
