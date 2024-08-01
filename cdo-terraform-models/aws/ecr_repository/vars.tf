variable "name" {
  type        = string
  description = "A string representing the ECR name"
}

variable "image_tag_mutability" {
  type        = string
  description = "A string representing the image tag mutability"
  default     = "MUTABLE"
}
