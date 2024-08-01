resource "aws_iam_policy" "iam-policy" {
  name   = var.name
  policy = var.policy
}

output "iam_policy_arn" {
  value = aws_iam_policy.iam-policy.arn
}
