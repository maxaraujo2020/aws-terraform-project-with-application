output "iam_role_ec2_name" {
  value = module.iam-role-assume-role-policy-ec2.iam_role_name
}

output "iam_role_ecs_task_arn" {
  value = module.iam-role-assume-role-policy-ecs-task.iam_role_arn
}

output "iam_role_ecs_execution_arn" {
  value = module.iam-role-assume-role-policy-ecs-execution.iam_role_arn
}

output "iam_access_key_id" {
  value = module.iam-access-key.iam_access_key_id
}

output "iam_access_key_secret" {
  value = module.iam-access-key.iam_access_key_secret
}
