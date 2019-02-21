variable "digitalocean_region" {
  description = "Region to build the infrastructure"
  default     = "lon1"
}

variable "kubernetes_master_image" {
  description = "Image to use"
  default     = "ubuntu-18-04-x64"
}

variable "kubernetes_master_size" {
  description = "Size of the kubernetes to deploy"
  default     = "s-2vcpu-2gb"
}

variable "kubernetes_master_count" {
  description = "Number of kubernetes masters to deploy"
  default     = 1
}

variable "kubernetes_node_image" {
  description = "Image to use"
  default     = "ubuntu-18-04-x64"
}

variable "kubernetes_node_size" {
  description = "Size of the kubernetes to deploy"
  default     = "s-1vcpu-1gb"
}

variable "kubernetes_node_count" {
  description = "Number of kubernetes nodes to deploy"
  default     = 1
}
