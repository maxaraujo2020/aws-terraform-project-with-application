# Creates ECS

module "ecs-cluster" {
  source = "../../../cdo-terraform-models/aws/ecs_cluster"
  name   = "${var.app_name}-ecs-cluster"
}
