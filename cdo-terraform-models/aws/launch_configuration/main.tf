resource "aws_launch_configuration" "launch-configuration" {
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  image_id                    = var.image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  name_prefix                 = "${var.name}-"
  security_groups             = var.security_groups
  user_data                   = var.user_data

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      image_id
    ]
  }

  root_block_device {
    volume_size = var.root_block_device_volume_size
    volume_type = var.root_block_device_volume_type
  }
}

output "launch_configuration_name" {
  value = aws_launch_configuration.launch-configuration.name
}
