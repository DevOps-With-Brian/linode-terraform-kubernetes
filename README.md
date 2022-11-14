# linode-terraform-kubernetes
Builds out a cluster on Linode for kubernetes also known as LKE on Linode.

**Ensure you have updated the terraform.tfvars appropriately to match the values you want to use.**

**Ensure you have the `export TF_VAR_token=XXX` var setup before running any of the following commands and ensure you have Terraform installed.**

`terraform init` - To setup the terraform initially

`terraform plan -var-file="terraform.tfvars"` - To validate before deploying what will be deployed.

`terraform apply -var-file="terraform.tfvars"` - To apply the changes/deploy cluster.

After deploy there should be a `kube-config` in the repo to be used to connect to the cluster.

Add this kubeconfig file to the `$KUBECONFIG` env var:

`export KUBECONFIG=kube-config`