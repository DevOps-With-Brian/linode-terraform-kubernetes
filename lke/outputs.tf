output "kubeconfig" {
   value = linode_lke_cluster.linode_lke.kubeconfig
   sensitive = true
}

output "api_endpoints" {
   value = linode_lke_cluster.linode_lke.api_endpoints
}

output "status" {
   value = linode_lke_cluster.linode_lke.status
}

output "id" {
   value = linode_lke_cluster.linode_lke.id
}

output "pool" {
   value = linode_lke_cluster.linode_lke.pool
}
