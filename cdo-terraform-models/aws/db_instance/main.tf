resource "aws_db_instance" "db-instance" {
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  availability_zone      = var.availability_zone
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  port                   = var.port
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_subnet_group_id
  vpc_security_group_ids = var.vpc_security_group_ids
}

output "db_instance_address" {
  value = aws_db_instance.db-instance.address
}

output "db_instance_password" {
  value = aws_db_instance.db-instance.password
}

output "db_instance_name" {
  value = aws_db_instance.db-instance.db_name
}
