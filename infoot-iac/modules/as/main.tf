# Creates AS

module "iam-instance-profile" {
  source = "../../../cdo-terraform-models/aws/iam_instance_profile"
  name   = "${var.app_name}-iam-instance-profile"
  role   = var.iam_instance_profile_role
}

module "private-key-rsa" {
  source = "../../../cdo-terraform-models/tls/private_key/RSA"
}

module "key-pair" {
  source     = "../../../cdo-terraform-models/aws/key_pair"
  key_name   = "${var.app_name}-key-pair"
  public_key = module.private-key-rsa.private_key_public
}

module "launch-configuration" {
  source                      = "../../../cdo-terraform-models/aws/launch_configuration"
  associate_public_ip_address = false
  iam_instance_profile        = module.iam-instance-profile.iam_instance_profile_name
  image_id                    = data.aws_ami.ami.id
  instance_type               = "t3.medium"
  key_name                    = module.key-pair.key_pair_name
  name                        = "${var.app_name}-launch-configuration"
  security_groups             = var.launch_configuration_security_groups
  user_data                   = var.launch_configuration_user_data
}

module "autoscaling-group" {
  source               = "../../../cdo-terraform-models/aws/appautoscaling_group"
  desired_capacity     = 1
  launch_configuration = module.launch-configuration.launch_configuration_name
  max_size             = 2
  min_size             = 1
  name                 = "${var.app_name}-autoscaling-group"
  target_group_arns    = var.autoscaling_group_target_group_arns
  vpc_zone_identifier  = var.autoscaling_group_vpc_zone_identifier
}
