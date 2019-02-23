resource "digitalocean_firewall" "node_inbound" {
  name         = "${var.kubernetes_firewall_name_prefix}-kubernetes-node-inbound"
  droplet_ids  = ["${digitalocean_droplet.node.*.id}"]
  inbound_rule = [
  {
    protocol           = "tcp"
    port_range         = "10250"
    source_droplet_ids = ["${digitalocean_droplet.master.*.id}"]
  },
  {
    protocol           = "udp"
    port_range         = "8472"
    source_droplet_ids = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  },
  {
    protocol           = "tcp"
    port_range         = "2379-2380"
    source_droplet_ids = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  },
  ]
}

resource "digitalocean_firewall" "master_inbound" {
  name         = "${var.kubernetes_firewall_name_prefix}-kubernetes-master-inbound"
  droplet_ids  = ["${digitalocean_droplet.master.*.id}"]
  inbound_rule = [
  {
    protocol           = "tcp"
    port_range         = "6443"
    source_droplet_ids = ["${digitalocean_droplet.node.*.id}"]
  },
  {
    protocol           = "tcp"
    port_range         = "2379-2380"
    source_droplet_ids = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  },
  {
    protocol           = "udp"
    port_range         = "8472"
    source_droplet_ids = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  },
  ]
}

resource "digitalocean_firewall" "all_outbound" {
  name         = "${var.kubernetes_firewall_name_prefix}-kubernetes-outbound"
  droplet_ids  = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  outbound_rule = [
    {
      protocol                = "tcp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "udp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "icmp"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "public_inbound" {
  name         = "${var.kubernetes_firewall_name_prefix}-kubernetes-public-inbound"
  droplet_ids  = ["${digitalocean_droplet.node.*.id}", "${digitalocean_droplet.master.*.id}"]
  inbound_rule = [
  {
    protocol         = "tcp"
    port_range       = "6443"
    source_addresses = "${var.ip_address_trusted}"
  },
  {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = "${var.ip_address_trusted}"
  },
  {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = "${var.ip_address_trusted}"
  },
  {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = "${var.ip_address_trusted}"
  },
  {
    protocol         = "tcp"
    port_range       = "30000-32767"
    source_addresses = "${var.ip_address_trusted}"
  },
  {
    protocol         = "udp"
    port_range       = "30000-32767"
    source_addresses = "${var.ip_address_trusted}"
  },
  ]
}
