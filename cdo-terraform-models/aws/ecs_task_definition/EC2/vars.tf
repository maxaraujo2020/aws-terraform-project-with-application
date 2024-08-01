variable "container_definitions" {
  type        = string
  description = "A object of strings representing the container definitions"
}

variable "cpu" {
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size
  type        = number
  description = "A number representing the task cpu"
}

variable "name" {
  type        = string
  description = "A string representing the task definition name"
}

variable "memory" {
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size
  type        = number
  description = "A number representing the task memory"
}

variable "task_role_arn" {
  type        = string
  description = "A string representing the task definition IAM role ARN"
}

variable "execution_role_arn" {
  type        = string
  description = "A string representing the task definition IAM execution ARN"
}

