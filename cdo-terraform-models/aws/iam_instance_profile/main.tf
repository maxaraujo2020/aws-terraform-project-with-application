resource "aws_iam_instance_profile" "iam-instance-profile" {
  name = var.name
  role = var.role
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.iam-instance-profile.name
}
