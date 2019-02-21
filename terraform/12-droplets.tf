resource "digitalocean_droplet" "master" {
  count      = "${var.kubernetes_master_count}"
  image      = "${var.kubernetes_master_image}"
  name       = "${format("%s%02d", var.kubernetes_master_name_prefix, count.index + 1)}"
  region     = "${var.digitalocean_region}"
  size       = "${var.kubernetes_master_size}"
  ssh_keys   = ["${data.digitalocean_ssh_key.ssh.id}"]

  provisioner "local-exec" {
    command = <<EOF
                . ~/venv/ansible/bin/activate;
                cd ../ansible;
                sleep 30;
                ansible-playbook -i '${self.ipv4_address},' kubernetes.yml;
                EOF
  }
}

resource "digitalocean_droplet" "node" {
  count      = "${var.kubernetes_node_count}"
  image      = "${var.kubernetes_node_image}"
  name       = "${format("%s%02d", var.kubernetes_node_name_prefix, count.index + 1)}"
  region     = "${var.digitalocean_region}"
  size       = "${var.kubernetes_node_size}"
  ssh_keys   = ["${data.digitalocean_ssh_key.ssh.id}"]

  provisioner "local-exec" {
    command = <<EOF
                . ~/venv/ansible/bin/activate;
                cd ../ansible;
                sleep 30;
                ansible-playbook -i '${self.ipv4_address},' kubernetes.yml;
                EOF
  }
}
