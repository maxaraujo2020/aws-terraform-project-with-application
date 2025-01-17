resource "aws_security_group" "security-group-ingress" {
  name        = var.name
  vpc_id      = var.vpc_id
  description = var.description

  ingress {
    from_port       = var.from_port
    to_port         = var.to_port
    protocol        = var.protocol
    description     = var.description
    cidr_blocks     = var.cidr_blocks
    security_groups = var.security_groups
  }
}

output "security_group_ingress_id" {
  value = aws_security_group.security-group-ingress.id
}
