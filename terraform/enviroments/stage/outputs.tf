output "app_external_ip" {
  value = module.app.app_external_ip
}
output "app_inner_ip" {
  value = module.app.app_inner_ip
}
output "db_external_ip" {
  value = module.db.db_external_ip
}
output "db_inner_ip" {
  value = module.db.db_inner_ip
}