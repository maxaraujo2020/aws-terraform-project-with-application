# Creates ECR

module "ecr-repository" {
  source = "../../../cdo-terraform-models/aws/ecr_repository"
  name   = "${var.app_name}-ecr-repository"
}

module "ecr-lifecycle-policy" {
  source        = "../../../cdo-terraform-models/aws/ecr_lifecycle_policy"
  count_number  = var.ecr_lifecycle_policy_count_number
  description   = "${var.app_name}-ecr-lifecycle-policy"
  repository    = module.ecr-repository.ecr_repository_name
  rule_priority = 1
  depends_on    = [module.ecr-repository]
}
