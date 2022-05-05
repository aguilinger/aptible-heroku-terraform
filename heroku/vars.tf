variable "app_quantity" {
  default     = 1
  description = "Number of dynos in your Heroku formation"
}

variable "app_name" {
  type = string
}

variable "dyno_size" {
  type = string
  default = "free"
}