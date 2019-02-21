output "kubernetes_master_ipv4_address" {
  value = "${digitalocean_droplet.master.*.ipv4_address}"
}

output "kubernetes_nodes_ipv4_address" {
  value = "${digitalocean_droplet.node.*.ipv4_address}"
}
