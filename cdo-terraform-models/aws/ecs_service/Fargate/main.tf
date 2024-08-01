resource "aws_ecs_service" "ecs-service" {
  name            = var.name
  cluster         = var.cluster
  task_definition = var.task_definition
  launch_type     = "FARGATE"
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.subnets
    assign_public_ip = true
    security_groups  = var.security_groups
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.name
    container_port   = var.container_port
  }
}

output "ecs_service_name" {
  value = aws_ecs_service.ecs-service.name
}
