variable "app_name" {
  type = string
  description = "The app name"
}

variable "env_name" {
  type = string
  description = "The aptible environment name"
}

variable "docker_image" {
  type = string
  description = "The application's docker image"
  default = "aguilinger/demo-app:1"
}

variable "container_port" {
  type = number
  default = 3000
  description = "Make sure this matches the EXPOSE'd port"
}

variable "process_type" {
  type = string
  default = "web"
  description = "Should match your Procfile (or 'cmd' if using the docker CMD directive)"
}

variable "app_quantity" {
  default     = 1
  description = "Number of services to run"
}