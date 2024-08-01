resource "docker_registry_image" "registry-image" {
  name = var.name
}

resource "docker_image" "image" {
  name = "${var.name}:1.0"
  build {
    context    = var.context_absolute_path
    dockerfile = var.dockerfile
    build_args = var.build_args
    no_cache   = true
    platform   = var.platform
  }
}
