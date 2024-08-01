# Creates SSM

module "ssm-parameter-access-key" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "access_key"
  value                 = var.ssm_parameter_access_key
}

module "ssm-parameter-bucket" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "bucket"
  value                 = var.ssm_parameter_bucket
}

module "ssm-parameter-bucket-region" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "bucket_region"
  value                 = var.ssm_parameter_bucket_region
}

module "ssm-parameter-db-instance-address" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "db_instance_address"
  value                 = var.ssm_parameter_db_instance_address
}

module "ssm-parameter-db-instance-password" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "db_instance_password"
  value                 = var.ssm_parameter_db_instance_password
}

module "ssm-parameter-secret-key" {
  source                = "../../../cdo-terraform-models/aws/ssm_parameter"
  app_name              = var.app_name
  parameter_environment = "dev"
  parameter_name        = "secret_key"
  value                 = var.ssm_parameter_secret_key
}
