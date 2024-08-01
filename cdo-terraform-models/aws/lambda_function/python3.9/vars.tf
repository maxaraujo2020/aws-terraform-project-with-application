variable "function" {
  type        = string
  description = "A string representing the existing function name reference at lambda_functions/functions folder"
}

variable "function_name" {
  type        = string
  description = "A string representing the Lambda function name"
}

variable "description" {
  type        = string
  description = "A string representing the Lambda function description"
}

variable "role" {
  type        = string
  description = "A string representing the Lambda function role ARN"
}
