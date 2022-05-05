output "app_url" {
  value       = aptible_endpoint.app_endpoint.virtual_domain
  description = "Application URL"
}
