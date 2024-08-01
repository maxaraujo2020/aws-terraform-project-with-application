# Creates ALB

module "alb" {
  source          = "../../../cdo-terraform-models/aws/alb"
  name            = "${var.app_name}-alb"
  security_groups = var.alb_security_groups
  subnets         = var.alb_subnets
}

module "alb-target-group" {
  source = "../../../cdo-terraform-models/aws/alb_target_group/stickiness"
  name   = "${var.app_name}-alb-tg"
  port   = local.container_port
  vpc_id = var.alb_target_group_vpc_id
}

module "alb-listener" {
  source            = "../../../cdo-terraform-models/aws/alb_listener"
  load_balancer_arn = module.alb.alb_arn
  name              = "${var.app_name}-alb-listener"
  target_group_arn  = module.alb-target-group.alb_target_group_arn
  port              = var.listener_port
  certificate_arn   = var.certificate_arn
  fqdn_list         = var.fqdn_list
  path_pattern      = var.path_pattern
}
