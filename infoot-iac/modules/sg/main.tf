# Creates SG

module "security-group-egress" {
  source      = "../../../cdo-terraform-models/aws/security_group/egress"
  cidr_blocks = ["0.0.0.0/0"]
  description = "${var.app_name} egress security group"
  from_port   = 0
  name        = "${var.app_name}-security-group-egress"
  protocol    = "-1"
  to_port     = 0
  vpc_id      = var.security_groups_vpc_id
}

module "security-group-egress-db" {
  source      = "../../../cdo-terraform-models/aws/security_group/egress"
  cidr_blocks = ["0.0.0.0/0"]
  description = "${var.app_name} DB egress security group"
  from_port   = var.security_group_db_port
  name        = "${var.app_name}-security-group-egress-db"
  protocol    = "tcp"
  to_port     = var.security_group_db_port
  vpc_id      = var.security_groups_vpc_id
}

module "security-group-ingress-db" {
  source      = "../../../cdo-terraform-models/aws/security_group/ingress"
  cidr_blocks = var.db_cidr_blocks
  description = "${var.app_name} DB ingress security group"
  from_port   = 0
  name        = "${var.app_name}-security-group-ingress-db"
  protocol    = "-1"
  to_port     = 0
  vpc_id      = var.security_groups_vpc_id
}

module "security-group-ingress-alb" {
  source      = "../../../cdo-terraform-models/aws/security_group/ingress"
  cidr_blocks = ["0.0.0.0/0"]
  description = "${var.app_name} ALB ingress security group"
  from_port   = var.listener_port
  name        = "${var.app_name}-security-group-ingress-alb"
  protocol    = "tcp"
  to_port     = var.listener_port
  vpc_id      = var.security_groups_vpc_id
}
module "security-group-ingress-ec2" {
  source          = "../../../cdo-terraform-models/aws/security_group/ingress"
  description     = "${var.app_name} EC2 ingress security group"
  from_port       = 0
  name            = "${var.app_name}-security-group-ingress-ec2"
  protocol        = "tcp"
  security_groups = [module.security-group-ingress-alb.security_group_ingress_id]
  to_port         = 65535
  vpc_id          = var.security_groups_vpc_id
}
