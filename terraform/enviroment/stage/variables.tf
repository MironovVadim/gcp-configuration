variable project {
  description = "Project ID"
  default     = "terraform-project-272717"
}
variable region {
  description = "Region"
  default     = "europe-west1"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "app-base-1586098114"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "mongodb-base-1586052131"
}
