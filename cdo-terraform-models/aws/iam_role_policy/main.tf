resource "aws_iam_role_policy" "iam-role-policy" {
  name   = var.name
  role   = var.role
  policy = jsonencode(var.policy)
}
