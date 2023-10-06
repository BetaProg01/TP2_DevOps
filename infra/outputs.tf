# Outputs the ID of the Docker container and image
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.container.id
}
# Outputs the ID of the Docker image
output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.build.id
}
