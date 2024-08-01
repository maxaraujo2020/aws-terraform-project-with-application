resource "aws_iam_user_policy" "iam-user-policy" {
  name   = var.name
  user   = var.user
  policy = var.policy
}
