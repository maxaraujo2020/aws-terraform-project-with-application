resource "aws_iam_policy_attachment" "iam-policy-attachment" {
  name       = var.name
  roles      = var.roles
  policy_arn = var.policy_arn
}
