Terraform configuration to build the digital ocean droplet

Requires the variables defined in 01-inputs-required.tf

Example terraform.tfvars:
```
digitalocean_token = "mydigitaloceanapikey"
kubernetes_node_name_prefix = "gblon02devknd"
kubernetes_master_name_prefix = "gblon02devkma"
kuberbetes_ssh_keys = [
  "root@ubuntu"
]
kubernetes_node_count = 2
```
