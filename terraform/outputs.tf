output "server_ip" {
  description = "Endereço IP do servidor criado"
  value       = hcloud_server.app.ipv4_address
}
