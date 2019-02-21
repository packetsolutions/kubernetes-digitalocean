variable "digitalocean_token" {
  description = "API token used to access digital ocean"
}

variable "kubernetes_master_name_prefix" {
  description = "Prefix to add to the kubernetes masters"
}

variable "kubernetes_node_name_prefix" {
  description = "Prefix to add to the kubernetes nodes"
}

variable "kubernetes_ssh_keys" {
  description = "SSH keys to add to the droplet"
  type        = "list"
}
