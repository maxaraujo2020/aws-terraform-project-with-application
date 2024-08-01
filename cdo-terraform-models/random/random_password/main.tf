resource "random_password" "random-password" {
  length  = var.length
  special = var.special
}

output "random_password_result" {
  value = random_password.random-password.result
}
