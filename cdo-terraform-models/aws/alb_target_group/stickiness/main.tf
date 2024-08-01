resource "aws_alb_target_group" "alb-target-group" {
  name     = var.name
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval = var.health_check_timeout * 2
    path     = var.health_check_path
    matcher  = var.health_check_matcher
    timeout  = var.health_check_timeout
  }

  stickiness {
    type = var.stickiness_type
  }
}

output "alb_target_group_arn" {
  value = aws_alb_target_group.alb-target-group.arn
}
