provider "aptible" {}

data "aptible_environment" "appenv" {
  handle = var.env_name
}

resource "aptible_database" "psql" {
  env_id = data.aptible_environment.appenv.env_id
  handle = var.app_name
  database_type = "postgresql"
  version = "14"
  container_size = 512
  disk_size = 10
}

resource "aptible_app" "app" {
  env_id = data.aptible_environment.appenv.env_id
  handle = var.app_name
  config = {
    APTIBLE_DOCKER_IMAGE = var.docker_image
    DATABASE_URL = aptible_database.psql.default_connection_url
  }
  service {
      process_type = var.process_type
      container_count = var.app_quantity
      container_memory_limit = 512
  }
}

resource "aptible_endpoint" "app_endpoint" {
  env_id = data.aptible_environment.appenv.env_id
  process_type = var.process_type
  resource_id = aptible_app.app.app_id
  resource_type = "app"
  endpoint_type = "https"
  internal = false
  container_port = var.container_port
  default_domain = true
}
