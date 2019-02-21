data "digitalocean_ssh_key" "ssh" {
  count = "${length(var.kubernetes_ssh_keys)}"
  name = "${element(var.kubernetes_ssh_keys, count.index)}"
}
