terraform {
  # Define the provider required to interact with Docker and its version
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Define the image as a ressource that you want to build
resource "docker_image" "build" {
  # The name of the image is a variable defined in the var.tf file, or with the option -var "image_name=..." when running terraform apply
  name         = var.image_name
  build {
    # Define the path to the Dockerfile
    context   = "../"
    dockerfile = "./Dockerfile"
  }
  # Keep the image locally after it is pushed to the registry
  keep_locally = true
}

# Define the container as a ressource that you want to run
resource "docker_container" "container" {
  image = docker_image.build.image_id
  # The name of the container is a variable defined in the var.tf file, or with the option -var "container_name=..." when running terraform apply
  name  = var.container_name
  # Define the port mapping between the host and the container, meaing the container exposes port 80 and the host will be able to access it on port 8000
  ports {
    internal = 80
    external = 8000
  }
}