variable "ecs_task_definition_container_definitions_path" {
  type        = string
  description = "A string representing the ECS task definition container_definitions.json absolute path"
}

variable "ecs_task_definition_image_repository_url" {
  type        = string
  description = "A string representing the ECS task definition image repository URL"
}

variable "ecs_task_definition_db_instance_name" {
  type        = string
  description = "A string representing the ECS task definition DB instance name"
}

variable "ecs_task_definition_image_tag" {
  type        = string
  description = "A string representing the ECS task definition image tag"
  default     = "latest"
}

variable "ecs_task_definition_awslogs_region" {
  type        = string
  description = "A string representing the ECS task definition AWS logs region"
}

variable "ecs_task_definition_access_key_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter access key ARN"
}

variable "ecs_task_definition_bucket_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter bucket ARN"
}

variable "ecs_task_definition_bucket_region_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter bucket region ARN"
}

variable "ecs_task_definition_db_instance_server_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter DB instance server ARN"
}

variable "ecs_task_definition_db_instance_password_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter DB instance password ARN"
}

variable "ecs_task_definition_secret_key_arn" {
  type        = string
  description = "A string representing the ECS task definition SSM parameter secret key ARN"
}

variable "app_name" {
  type        = string
  description = "A string representing the APP name"
}

variable "ecs_task_definition_task_role_arn" {
  type        = string
  description = "A string representing the ECS task definition IAM task role ARN"
}

variable "ecs_task_definition_execution_role_arn" {
  type        = string
  description = "A string representing the ECS task definition IAM execution role ARN"
}

variable "ecs_service_cluster" {
  type        = string
  description = "A string representing the ECS service cluster ID"
}

variable "ecs_service_load_balancer_target_group_arn" {
  type        = string
  description = "A string representing ECS service ALB target group ARN"
}
