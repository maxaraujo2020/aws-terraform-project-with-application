resource "aws_ecs_task_definition" "ecs-task-definition" {
  container_definitions    = var.container_definitions
  cpu                      = var.cpu
  family                   = var.name
  memory                   = var.memory
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn

  lifecycle {
    ignore_changes = [
      container_definitions
    ]
  }
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.ecs-task-definition.arn
}

output "ecs_task_definition_family" {
  value = aws_ecs_task_definition.ecs-task-definition.family
}

output "ecs_task_definition_revision" {
  value = aws_ecs_task_definition.ecs-task-definition.revision

}
