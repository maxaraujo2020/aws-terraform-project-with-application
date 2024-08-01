resource "aws_alb_target_group" "alb-target-group" {
  name                 = var.name
  port                 = var.port
  protocol             = "HTTP"
  target_type          = var.target_type
  vpc_id               = var.vpc_id
  deregistration_delay = "60"

  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = "200"
    path                = var.health_check_path
    protocol            = "HTTP"
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.health_check_unhealthy_threshold

  }
}

output "alb_target_group_arn" {
  value = aws_alb_target_group.alb-target-group.arn
}
