# Define the name of the Docker image as a variable
variable "image_name" {
  description = "Name for the Docker image used"
  type        = string
  default     = "builduwu"
}

# Define the name of the Docker container as a variable
variable "container_name" {
  description = "Name for the Docker container"
  type        = string
  default     = "containuwu"
}
