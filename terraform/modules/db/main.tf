resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  tags = ["reddit-db"]
  metadata = {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }

  # определение сетевого интерфейса
  network_interface {
    network = "default"
    # сеть к которой присоединить данный интерфейс network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  # правило применимо к инстансам с тегом...
  target_tags = ["reddit-db"]
  # порт будет доступен только для инстансов с тегом...
  source_tags = ["reddit-app"]
}
