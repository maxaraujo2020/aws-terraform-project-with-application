resource "aws_route_table" "route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = var.nat_gateway_id
    gateway_id     = var.gateway_id
  }

  lifecycle {
    ignore_changes = [
      route
    ]
  }
  tags = {
    Name = var.name
  }
}

output "route_table_id" {
  value = aws_route_table.route-table.id
}
