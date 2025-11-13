terraform {
  required_version = ">= 1.5.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.39.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_ssh_key" "default" {
  name = var.ssh_key_name
}

resource "hcloud_server" "app" {
  name        = var.server_name
  server_type = var.server_type
  image       = var.image
  location    = var.server_location
  ssh_keys    = [data.hcloud_ssh_key.default.id]

  firewall_ids = [hcloud_firewall.app_fw.id]
}

resource "hcloud_firewall" "app_fw" {
  name = "fw-${var.server_name}"

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = ["0.0.0.0/0"]
  }
}


