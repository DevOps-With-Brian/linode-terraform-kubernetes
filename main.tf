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

provider "helm" {
  kubernetes {
    config_path = "kube-config"
  }
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

resource "helm_release" "ingress-nginx" {
  depends_on   = [local_file.kubeconfig]
  name       = "ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
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

resource "local_file" "kubeconfig" {
  depends_on   = [linode_lke_cluster.linode_lke]
  filename     = "kube-config"
  content      = base64decode(linode_lke_cluster.linode_lke.kubeconfig)
}