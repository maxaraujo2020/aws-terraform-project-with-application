# Pushes the image

resource "time_sleep" "wait-30-seconds-1" {
  create_duration = "30s"
}

module "registry-image" {
  source                = "../../../cdo-terraform-models/docker/docker_registry_image/platform"
  build_args            = {}
  context_absolute_path = var.registry_image_context_absolute_path
  dockerfile            = var.registry_image_dockerfile
  name                  = "${var.registry_image_repository_url}:latest"
  depends_on            = [time_sleep.wait-30-seconds-1] # Implicit dependence
}
