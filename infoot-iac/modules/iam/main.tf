# Creates IAM
# TODO revisit all modules

module "iam-role-assume-role-policy-ec2" {
  source = "../../../cdo-terraform-models/aws/iam_role"
  assume_role_policy = {
    Version = "2012-10-17",
    Statement = [{
      Sid    = "AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["ec2.amazonaws.com"]
      }
      Action = ["sts:AssumeRole"]
    }]
  }
  name = "${var.app_name}-iam-role-ec2"
}

module "iam-role-assume-role-policy-ecs-task" {
  source = "../../../cdo-terraform-models/aws/iam_role"
  assume_role_policy = {
    Version = "2012-10-17",
    Statement = [{
      Sid    = "AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["ecs-tasks.amazonaws.com"]
      }
      Action = ["sts:AssumeRole"]
    }]
  }
  name = "${var.app_name}-iam-role-ecs-task"
}

module "iam-role-assume-role-policy-ecs-execution" {
  source = "../../../cdo-terraform-models/aws/iam_role"
  assume_role_policy = {
    Version = "2012-10-17",
    Statement = [{
      Sid    = "AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["ecs-tasks.amazonaws.com"]
      }
      Action = ["sts:AssumeRole"]
    }]
  }
  name = "${var.app_name}-iam-role-ecs-execution"
}

module "iam-policy" {
  source = "../../../cdo-terraform-models/aws/iam_policy"
  name   = "${var.app_name}-iam-policy"
  policy = data.aws_iam_policy_document.iam-policy-document-ssm.json
}

module "iam-role-policy-attachment-ec2" {
  source     = "../../../cdo-terraform-models/aws/iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role       = module.iam-role-assume-role-policy-ec2.iam_role_id
  depends_on = [module.iam-role-assume-role-policy-ec2]
}

module "iam-role-policy-attachment-ec2-ssm" {
  source     = "../../../cdo-terraform-models/aws/iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.iam-role-assume-role-policy-ec2.iam_role_id
  depends_on = [module.iam-role-assume-role-policy-ec2]
}

module "iam-role-policy-attachment-ecs-task" {
  source     = "../../../cdo-terraform-models/aws/iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = module.iam-role-assume-role-policy-ecs-task.iam_role_id
  depends_on = [module.iam-role-assume-role-policy-ecs-task]
}

module "iam-policy-attachment" {
  source     = "../../../cdo-terraform-models/aws/iam_policy_attachment"
  name       = "${var.app_name}-iam-policy-attachment"
  policy_arn = module.iam-policy.iam_policy_arn
  roles      = [module.iam-role-assume-role-policy-ecs-execution.iam_role_id]
  depends_on = [
    module.iam-policy,
    module.iam-role-assume-role-policy-ecs-execution
  ]
}

module "iam-role-policy-attachment-ecs-execution" {
  source     = "../../../cdo-terraform-models/aws/iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = module.iam-role-assume-role-policy-ecs-execution.iam_role_id
  depends_on = [module.iam-role-assume-role-policy-ecs-execution]
}

module "iam-role-policy-attachment-ecs-execution-cloudwatch" {
  source     = "../../../cdo-terraform-models/aws/iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = module.iam-role-assume-role-policy-ecs-execution.iam_role_id
  depends_on = [module.iam-role-assume-role-policy-ecs-execution]
}

module "iam-user" {
  source   = "../../../cdo-terraform-models/aws/iam_user"
  app_name = var.app_name
  name     = "${var.app_name}-iam-user"
}

module "iam-access-key" {
  source     = "../../../cdo-terraform-models/aws/iam_access_key"
  user       = module.iam-user.iam_user_name
  depends_on = [module.iam-user]
}

module "iam-user-policy" {
  source = "../../../cdo-terraform-models/aws/iam_user_policy"
  name   = "${var.app_name}-iam-user-policy"
  policy = data.aws_iam_policy_document.iam-policy-document-s3.json
  user   = module.iam-user.iam_user_name
}
