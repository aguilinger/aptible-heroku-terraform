provider "heroku" {}

resource "heroku_app" "example" {
  name   = var.app_name
  region = "us"
}

resource "heroku_addon" "postgres" {
  app  = heroku_app.example.id
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_build" "example" {
  app = heroku_app.example.id

  source {
    path = "../app"
  }
}
resource "heroku_formation" "example" {
  app        = heroku_app.example.id
  type       = "web"
  quantity   = var.app_quantity
  size       = var.dyno_size
  depends_on = [heroku_build.example]
}