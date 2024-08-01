locals {
  container_definitions = templatefile(
    var.ecs_task_definition_container_definitions_path,
    {
      # App
      image_repository_url = var.ecs_task_definition_image_repository_url
      image_tag            = var.ecs_task_definition_image_tag
      db_instance_name     = var.ecs_task_definition_db_instance_name

      # Log configuration
      awslogs_region        = var.ecs_task_definition_awslogs_region
      awslogs_group         = "${var.app_name}-logs-group"
      awslogs_stream_prefix = "${var.app_name}-stream"

      # Secrets
      access_key_arn           = var.ecs_task_definition_access_key_arn
      bucket_arn               = var.ecs_task_definition_bucket_arn
      bucket_region_arn        = var.ecs_task_definition_bucket_region_arn
      db_instance_server_arn   = var.ecs_task_definition_db_instance_server_arn
      db_instance_password_arn = var.ecs_task_definition_db_instance_password_arn
      secret_key_arn           = var.ecs_task_definition_secret_key_arn
    }
  )
  raw_data       = jsondecode(local.container_definitions)
  container_name = local.raw_data[0].name
  container_port = tonumber(local.raw_data[0].portMappings[0].containerPort)
}
