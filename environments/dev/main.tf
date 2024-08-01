# Creates VPC, subnet, internet gateway and route table
module "network" {
  source         = "../../infoot-iac/modules/network"
  app_name       = local.app_name
  vpc_cidr_block = "10.10.0.0/16"
}

# Creates IAM
module "iam" {
  source   = "../../infoot-iac/modules/iam"
  app_name = local.app_name
}

# Creates S3 bucket
module "s3" {
  source   = "../../infoot-iac/modules/s3"
  app_name = local.app_name
}

# Creates ECR
module "ecr" {
  source                            = "../../infoot-iac/modules/ecr"
  app_name                          = local.app_name
  ecr_lifecycle_policy_count_number = 10
}

# Creates ECS
module "ecs" {
  source   = "../../infoot-iac/modules/ecs"
  app_name = local.app_name
}

# Creates SG
module "sg" {
  source                 = "../../infoot-iac/modules/sg"
  app_name               = local.app_name
  listener_port          = local.listener_port
  security_group_db_port = local.db_instance_port
  security_groups_vpc_id = module.network.network_vpc_id
  db_cidr_blocks         = [module.network.network_vpc_cidr]
  depends_on             = [module.network]
}

# Creates DB
module "db" {
  source                        = "../../infoot-iac/modules/db"
  app_name                      = local.app_name
  db_instance_availability_zone = "${local.aws_region}a"
  db_instance_name              = local.db_instance_name
  db_instance_port              = local.db_instance_port
  db_instance_username          = local.db_instance_username
  db_instance_vpc_security_group_ids = [
    module.sg.sg_egress_db_id,
    module.sg.sg_ingress_db_id
  ]
  db_subnet_group_subnet_ids = module.network.network_subnet_private.*.subnet_id
  depends_on = [
    module.sg,
    module.network
  ]
}

# Creates SSM
module "ssm" {
  source                             = "../../infoot-iac/modules/ssm"
  app_name                           = local.app_name
  ssm_parameter_access_key           = module.iam.iam_access_key_id
  ssm_parameter_secret_key           = module.iam.iam_access_key_secret
  ssm_parameter_bucket               = module.s3.s3_bucket
  ssm_parameter_bucket_region        = module.s3.s3_bucket_region
  ssm_parameter_db_instance_address  = module.db.db_instance_address
  ssm_parameter_db_instance_password = module.db.db_instance_password
  depends_on = [
    module.iam,
    module.s3,
    module.db
  ]
}

# Creates ALB
module "alb" {
  source = "../../infoot-iac/modules/alb"
  alb_security_groups = [
    module.sg.sg_egress_id,
    module.sg.sg_ingress_alb_id
  ]
  alb_subnets                = module.network.network_subnet_public.*.subnet_id
  alb_target_group_vpc_id    = module.network.network_vpc_id
  app_name                   = local.app_name
  container_definitions_path = local.container_definitions_path
  listener_port              = local.listener_port
  path_pattern               = local.path_pattern
  fqdn_list                  = local.fqdn_list
  certificate_arn            = local.certificate_arn
  depends_on = [
    module.sg,
    module.network
  ]
}

# Creates EFS
module "efs" {
  source         = "../../infoot-iac/modules/efs"
  efs_subnets    = module.network.network_subnet_public.*.subnet_id
  app_name       = local.app_name
  vpc_cidr_block = module.network.network_vpc_cidr
  vpc_id         = module.network.network_vpc_id
}

# Creates ECS task definition and ECS service
module "service" {
  source                                         = "../../infoot-iac/modules/service"
  app_name                                       = local.app_name
  ecs_service_cluster                            = module.ecs.ecs_cluster_name
  ecs_service_load_balancer_target_group_arn     = module.alb.alb_target_group_arn
  ecs_task_definition_awslogs_region             = local.aws_region
  ecs_task_definition_access_key_arn             = module.ssm.ssm_parameter_access_key_arn
  ecs_task_definition_bucket_arn                 = module.ssm.ssm_parameter_bucket_arn
  ecs_task_definition_bucket_region_arn          = module.ssm.ssm_parameter_bucket_region_arn
  ecs_task_definition_container_definitions_path = local.container_definitions_path
  ecs_task_definition_db_instance_name           = module.db.db_instance_name
  ecs_task_definition_db_instance_server_arn     = module.ssm.ssm_parameter_db_instance_address_arn
  ecs_task_definition_db_instance_password_arn   = module.ssm.ssm_parameter_db_instance_password_arn
  ecs_task_definition_execution_role_arn         = module.iam.iam_role_ecs_execution_arn
  ecs_task_definition_image_repository_url       = module.ecr.ecr_repository_url
  ecs_task_definition_image_tag                  = "latest"
  ecs_task_definition_task_role_arn              = module.iam.iam_role_ecs_task_arn
  ecs_task_definition_secret_key_arn             = module.ssm.ssm_parameter_secret_key_arn
  depends_on = [
    module.ecs,
    module.alb,
    module.ssm,
    module.ecr,
    module.iam,
    module.db, # Implicit dependence
    module.s3  # Implicit dependence
  ]
}

# Creates AS
module "as" {
  source                                = "../../infoot-iac/modules/as"
  app_name                              = local.app_name
  autoscaling_group_target_group_arns   = [module.alb.alb_target_group_arn]
  autoscaling_group_vpc_zone_identifier = module.network.network_subnet_private.*.subnet_id
  iam_instance_profile_role             = module.iam.iam_role_ec2_name
  launch_configuration_security_groups = [
    module.sg.sg_egress_id,
    module.sg.sg_ingress_ec2_id
  ]
  launch_configuration_user_data = "#!/bin/bash\necho ECS_CLUSTER=${module.ecs.ecs_cluster_name} >> /etc/ecs/ecs.config"
  depends_on = [
    module.alb,
    module.network,
    module.iam,
    module.sg,
    module.ecs,
    module.efs,
    module.db, # Implicit dependence
    module.s3, # Implicit dependence
    module.ssm # Implicit dependence
  ]
}

# Creates ACM
# module "acm" {
#   source                                         = "../../infoot-iac/modules/acm"
# }  
