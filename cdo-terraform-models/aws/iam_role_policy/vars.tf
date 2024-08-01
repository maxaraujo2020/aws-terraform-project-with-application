variable "name" {
  type        = string
  description = "A string representing the IAM role policy name"
}

variable "role" {
  type        = string
  description = "A string representing the IAM role policy role"
}

variable "policy" {
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
  description = "A group of objects representing the IAM role policy"
}
