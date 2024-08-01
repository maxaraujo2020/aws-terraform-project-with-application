resource "aws_iam_access_key" "iam-access-key" {
  user = var.user
}

output "iam_access_key_id" {
  value = aws_iam_access_key.iam-access-key.id
}

output "iam_access_key_secret" {
  value = aws_iam_access_key.iam-access-key.secret
}
