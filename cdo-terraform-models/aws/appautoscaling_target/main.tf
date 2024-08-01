resource "aws_appautoscaling_target" "appautoscaling-target" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.cluster_name}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

output "appautoscaling_target_scalable_dimension" {
  value = aws_appautoscaling_target.appautoscaling-target.scalable_dimension
}

output "appautoscaling_target_service_namespace" {
  value = aws_appautoscaling_target.appautoscaling-target.service_namespace
}
