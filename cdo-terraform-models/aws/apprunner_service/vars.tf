variable "service_name" {
  type        = string
  description = "A string representing the service name"
}

variable "cpu" {
  type        = number
  description = "A number representing the number of CPU units reserved for each APP Runner instance"
  validation {
    condition     = contains([1024, 2048], var.cpu)
    error_message = "Variable cpu must be 1024 or 2048."
  }
  default = 1024
}

variable "memory" {
  type        = number
  description = "A number representing the amount of memory reserved for each APP Runner instance"
  validation {
    condition     = contains([2048, 3072, 4096], var.memory)
    error_message = "Variable memory must be 2048, 3072 or 4096."
  }
  default = 2048
}

# variable "instance_role_arn" {
#   type            = string
#   description     = "A string representing the role ARN for App Runner instance regarding code needed permissions"
# }

variable "vpc_connector_arn" {
  type        = string
  description = "A string representing the VPC ARN for App Runner service"
}

variable "repository_url" {
  type        = string
  description = "A string representing the image repository url.\nSample: 'aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName'"
}

variable "tag" {
  type        = string
  description = "A string representing the image tag.\nSample: 'latest'"
  default     = "latest"
}

variable "port" {
  type        = string
  description = "A string representing the container listening port"
  default     = "5000"
}

variable "runtime_environment_variables" {
  type        = map(string)
  description = "A map of strings representing the runtime environment variables"
  default     = null
}

variable "start_command" {
  type        = string
  description = "A string representing the application start command"
  default     = null
}

variable "access_role_arn" {
  type        = string
  description = "A string representing the IAM role ARN for App Runner ECR repository access"
}
