variable "hcloud_token" {
  type        = string
  description = "Hetzner API Token"
}

variable "ssh_key_name" {
  type        = string
  description = "Nome da chave SSH cadastrada na Hetzner"
}

variable "server_name" {
  type    = string
  default = "supremo-api"
}

variable "server_type" {
  type    = string
  default = "cpx11"
}

variable "server_location" {
  type    = string
  default = "fsn1"
}

variable "image" {
  type    = string
  default = "ubuntu-22.04"
}
