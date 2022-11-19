terraform {
  cloud {
    organization = "brianhh12301"

    workspaces {
      name = "linode-terraform-lke"
    }
  }
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
    config_path = "lke-cluster-config.yaml"
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
  depends_on   = [linode_lke_cluster.linode_lke]
  name       = "ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
}