# linode-terraform-kubernetes
Builds out a cluster on Linode for kubernetes also known as LKE on Linode.

**Ensure you have updated the terraform.tfvars appropriately to match the values you want to use.**

**Ensure you have the `export TF_VAR_token=XXX` var setup before running any of the following commands and ensure you have Terraform installed.**

`terraform init` - To setup the terraform initially

`terraform plan -var-file="terraform.tfvars"` - To validate before deploying what will be deployed.

`terraform apply -var-file="terraform.tfvars"` - To apply the changes/deploy cluster.

After deploy to save kubeconfig to file do the following:

```
export KUBE_VAR=`terraform output kubeconfig` && echo $KUBE_VAR | base64 -di > ~/lke-cluster-config.yaml
```

Add this kubeconfig file to the `$KUBECONFIG` env var:

`export KUBECONFIG=~/lke-cluster-config.yaml`