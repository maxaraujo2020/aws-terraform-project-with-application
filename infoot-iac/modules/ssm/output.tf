output "ssm_parameter_access_key_arn" {
  value = module.ssm-parameter-access-key.ssm_parameter_arn
}

output "ssm_parameter_bucket_arn" {
  value = module.ssm-parameter-bucket.ssm_parameter_arn
}

output "ssm_parameter_bucket_region_arn" {
  value = module.ssm-parameter-bucket-region.ssm_parameter_arn
}

output "ssm_parameter_db_instance_address_arn" {
  value = module.ssm-parameter-db-instance-address.ssm_parameter_arn
}

output "ssm_parameter_db_instance_password_arn" {
  value = module.ssm-parameter-db-instance-password.ssm_parameter_arn
}

# output "ssm_parameter_db_instance_port_arn" {
#   value = module.ssm-parameter-db-instance-port.ssm_parameter_arn
# }
#
# output "ssm_parameter_db_instance_user_arn" {
#   value = module.ssm-parameter-db-instance-user.ssm_parameter_arn
# }

output "ssm_parameter_secret_key_arn" {
  value = module.ssm-parameter-secret-key.ssm_parameter_arn
}
