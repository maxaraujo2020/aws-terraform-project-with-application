resource "aws_iam_role" "iam-role" {
  name               = var.name
  assume_role_policy = jsonencode(var.assume_role_policy)
}

output "iam_role_id" {
  value = aws_iam_role.iam-role.id
}

output "iam_role_arn" {
  value = aws_iam_role.iam-role.arn
}

output "iam_role_name" {
  value = aws_iam_role.iam-role.name
}
