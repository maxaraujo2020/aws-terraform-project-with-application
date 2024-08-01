resource "aws_ecs_cluster" "ecs-cluster" {
  name = var.name

  lifecycle {
    create_before_destroy = true
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs-cluster.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs-cluster.name
}
