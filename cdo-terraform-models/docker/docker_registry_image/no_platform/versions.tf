terraform {
  required_version = ">= 0.13"

  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
