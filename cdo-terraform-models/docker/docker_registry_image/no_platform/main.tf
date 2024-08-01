resource "docker_registry_image" "registry-image" {
  name = var.name

  build {
    context    = var.context_absolute_path
    dockerfile = var.dockerfile
    build_args = var.build_args
    no_cache   = true
  }
}
