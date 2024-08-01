variable "name" {
  type        = string
  description = "A string representing the IAM role name"
}

variable "assume_role_policy" {
  type = object({
    Version = string
    Statement = list(object({
      Sid    = string
      Effect = string
      Principal = object({
        Service = list(string)
      })
      Action = list(string)
    }))
  })
  description = "A group of objects representing a assume role policy"
}
