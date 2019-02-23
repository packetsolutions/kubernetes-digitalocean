# Runbook
1 - Add terraform.tfvars file into terraform folder using the README.md file for
guideance. Bring up the cluster with:
```
terraform apply
```

2 - Initialize the kubernetes cluster - log into a master and run
```ssh -l root $(terraform output -state=terraform/terraform.tfstate kubernetes_master_ipv4_address) kubeadm init --pod-network-cidr=10.244.0.0/16```

3 - Download the kubectl configuration from the master (or configure manually)
```
scp root@$(cd terraform; terraform output kubernetes_master_ipv4_address |
head -1):/etc/kubernetes/admin.conf config
```

4 - Deploy POD network from desktop
```kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml```

5 - Add nodes to master

6 - Add ingress:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/baremetal/service-nodeport.yaml
```
