resource "aws_ssm_parameter" "ssm-parameter" {
  name  = "/${var.app_name}/${var.parameter_environment}/${var.parameter_name}"
  type  = "SecureString"
  value = var.value
}

output "ssm_parameter_name" {
  value = aws_ssm_parameter.ssm-parameter.name
}

output "ssm_parameter_arn" {
  value = aws_ssm_parameter.ssm-parameter.arn
}
