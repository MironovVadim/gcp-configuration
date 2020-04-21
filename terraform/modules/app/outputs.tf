output "app_external_ip" {
  value = google_compute_instance.app.network_interface.0.access_config.0.nat_ip
}
output "app_inner_ip" {
  value = google_compute_instance.app.network_interface.0.network_ip
}
output "name" {
  value = google_compute_instance.app.name
}