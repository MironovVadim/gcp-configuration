provider "google" {
  credentials = file("~//AppData/Roaming/gcloud/application_default_credentials.json")
  project = var.project
  region  = var.region
}
module "app" {
  source          = "../../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
}
module "db" {
  source          = "../../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
}
module "vpc" {
  source        = "../../modules/vpc"
  source_ranges = ["109.252.20.52/32"]
}
terraform {
  backend "local" {
  }
}