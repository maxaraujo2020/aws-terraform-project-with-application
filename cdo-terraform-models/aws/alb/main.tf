resource "aws_alb" "alb" {
  name            = var.name
  security_groups = var.security_groups
  subnets         = var.subnets
}

output "alb_arn" {
  value = aws_alb.alb.arn
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}
