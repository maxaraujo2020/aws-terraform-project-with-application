# Creates DB

module "random-password" {
  source = "../../../cdo-terraform-models/random/random_password"
}

module "db-subnet-group" {
  source     = "../../../cdo-terraform-models/aws/db_subnet_group"
  name       = "${var.app_name}-db-subnet-group"
  subnet_ids = var.db_subnet_group_subnet_ids
}

module "db-instance" {
  source                 = "../../../cdo-terraform-models/aws/db_instance"
  availability_zone      = var.db_instance_availability_zone
  db_name                = var.db_instance_name
  db_subnet_group_id     = module.db-subnet-group.db_subnet_group_id
  identifier             = "${var.app_name}-db-instance"
  password               = module.random-password.random_password_result
  port                   = var.db_instance_port
  username               = var.db_instance_username
  vpc_security_group_ids = var.db_instance_vpc_security_group_ids
  depends_on = [
    module.db-subnet-group,
    module.random-password
  ]
}
