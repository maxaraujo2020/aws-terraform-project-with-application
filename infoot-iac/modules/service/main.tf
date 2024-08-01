# Creates ECS task definition and ECS service

module "ecs-task-definition" {
  source                = "../../../cdo-terraform-models/aws/ecs_task_definition/EC2"
  cpu                   = 512
  container_definitions = local.container_definitions
  execution_role_arn    = var.ecs_task_definition_execution_role_arn
  memory                = 1024
  name                  = "${var.app_name}-task-definition"
  task_role_arn         = var.ecs_task_definition_task_role_arn
}

module "ecs-service" {
  source                         = "../../../cdo-terraform-models/aws/ecs_service/EC2"
  cluster                        = var.ecs_service_cluster
  container_name                 = local.container_name
  load_balancer_container_port   = local.container_port
  load_balancer_target_group_arn = var.ecs_service_load_balancer_target_group_arn
  name                           = "${var.app_name}-ecs-service"
  task_definition                = "${module.ecs-task-definition.ecs_task_definition_family}:${max(module.ecs-task-definition.ecs_task_definition_revision, data.aws_ecs_task_definition.this.revision)}"
}

