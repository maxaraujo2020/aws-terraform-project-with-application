resource "aws_route_table" "route-table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
  }
}

output "route_table_id" {
  value = aws_route_table.route-table.id
}
