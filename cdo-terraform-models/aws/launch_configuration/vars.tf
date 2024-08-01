variable "associate_public_ip_address" {
  type        = bool
  description = "A bool representing the public IP address association"
}

variable "iam_instance_profile" {
  type        = string
  description = "A string representing the IAM instance profile"
}

variable "image_id" {
  type        = string
  description = "A string representing the image ID"
}

variable "instance_type" {
  type        = string
  description = "A string representing the instance type"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "A string representing the keypair name"
}

variable "name" {
  type        = string
  description = "A string representing the instance name for prefix name"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of strings representing the instance security groups"
}

variable "user_data" {
  type        = string
  description = "A string representing the instance start command"
}

variable "root_block_device_volume_size" {
  type        = string
  description = "A string representing the root block device volume size"
  default     = 30
}

variable "root_block_device_volume_type" {
  type        = string
  description = "A string representing the root block device volume type"
  default     = "gp2"
}
