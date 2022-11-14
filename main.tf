terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.4"
    }
  }
}

provider "linode" {
  token = var.token
}

resource "linode_lke_cluster" "linode_lke" {
    label       = var.label
    k8s_version = var.k8s_version
    region      = var.region
    tags        = var.tags

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

//Export this cluster's attributes
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