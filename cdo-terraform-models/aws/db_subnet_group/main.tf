resource "aws_db_subnet_group" "db-subnet-group" {
  name       = var.name
  subnet_ids = var.subnet_ids
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.db-subnet-group.id
}
