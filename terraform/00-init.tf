terraform {
  required_version = ">= 0.11.0"
}

provider "digitalocean" {
  version = "~> 1.0"
  token   = "${var.digitalocean_token}"
}
