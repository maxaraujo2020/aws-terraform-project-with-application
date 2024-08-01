variable "name" {
  type        = string
  description = "A string representing the image name"
}

variable "context_absolute_path" {
  type        = string
  description = "A string representing the Dockerfile context absolute path"
}

variable "dockerfile" {
  type        = string
  description = "A string representing the Dockerfile name"
}

variable "build_args" {
  type        = map(string)
  description = "A object representing the registry image build arguments.\nSample: {KEY = value}"
}

variable "platform" {
  type        = string
  description = "A string representing the build platform"
  default     = "linux/amd64"
}
