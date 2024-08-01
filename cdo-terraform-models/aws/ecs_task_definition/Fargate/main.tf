resource "aws_ecs_task_definition" "ecs-task-definition" {
  family                   = var.name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
  container_definitions = jsonencode([{
    name      = var.name
    image     = var.image
    cpu       = var.cpu
    memory    = var.memory
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.host_port
    }]
  }])
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.ecs-task-definition.arn
}
