resource "aws_autoscaling_group" "autoscaling-group" {
  desired_capacity     = var.desired_capacity
  health_check_type    = "EC2"
  launch_configuration = var.launch_configuration
  max_size             = var.max_size
  min_size             = var.min_size
  name                 = var.name
  target_group_arns    = var.target_group_arns
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier  = var.vpc_zone_identifier

  tag {
    key                 = "name"
    propagate_at_launch = true
    value               = var.name
  }
}
