resource "aws_ecs_service" "ecs-service" {
  name                    = var.name
  cluster                 = var.cluster
  desired_count           = var.desired_count
  enable_ecs_managed_tags = true
  force_new_deployment    = true
  task_definition         = var.task_definition

  load_balancer {
    target_group_arn = var.load_balancer_target_group_arn
    container_name   = var.container_name
    container_port   = var.load_balancer_container_port
  }
}

output "ecs_service_name" {
  value = aws_ecs_service.ecs-service.name
}
