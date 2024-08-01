variable "name" {
  type        = string
  description = "A string representing the DB subnet group name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of strings representing subnet IDs"
}
