variable "length" {
  type        = number
  description = "A number representing the random password length"
  default     = 16
}

variable "special" {
  type        = bool
  description = "A bool representing the random password special char presence"
  default     = false
}
