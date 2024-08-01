variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "ssm_parameter_access_key" {
  type        = string
  description = "A string representing the SSM parameter access key"
}

variable "ssm_parameter_bucket" {
  type        = string
  description = "A string representing the SSM parameter bucket value"
}

variable "ssm_parameter_bucket_region" {
  type        = string
  description = "A string representing the SSM parameter bucket region"
}

variable "ssm_parameter_db_instance_address" {
  type        = string
  description = "A string representing the DB instance address"
}

variable "ssm_parameter_db_instance_password" {
  type        = string
  description = "A string representing the DB instance password"
}

variable "ssm_parameter_secret_key" {
  type        = string
  description = "A string representing the SSM parameter secret key"
}
