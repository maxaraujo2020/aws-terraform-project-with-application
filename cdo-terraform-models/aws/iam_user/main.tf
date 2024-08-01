resource "aws_iam_user" "iam-user" {
  name = var.name
  path = "/${var.app_name}/"
}

output "iam_user_name" {
  value = aws_iam_user.iam-user.name
}
