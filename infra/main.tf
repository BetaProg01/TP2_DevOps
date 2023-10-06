terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "build" {
  name         = var.image_name
  build {
    context   = "../"
    dockerfile = "./Dockerfile"
  }
  keep_locally = true
}

resource "docker_container" "container" {
  image = docker_image.build.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 8000
  }
}