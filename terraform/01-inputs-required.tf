variable "digitalocean_token" {
  description = "API token used to access digital ocean"
}

variable "kubernetes_master_name_prefix" {
  description = "Prefix to add to the kubernetes masters"
}

variable "kubernetes_node_name_prefix" {
  description = "Prefix to add to the kubernetes nodes"
}

variable "kubernetes_firewall_name_prefix" {
  description = "Prefix to add to the kubernetes nodes"
}

variable "kubernetes_ssh_keys" {
  description = "SSH keys to add to the droplet"
  type        = "list"
}

variable "ip_address_trusted" {
  description = "A list of public IPs that are use the kubernetes api"
  type        = "list"
}
