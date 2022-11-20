terraform {
  cloud {
    organization = "brianhh12301"

    workspaces {
      name = "linode-terraform-cert-manager"
    }
  }
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.4"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.16.0"
    }
  }
}

data "terraform_remote_state" "lke" {
    backend = "remote"

    config = {
        organization = "brianhh12301"
         workspaces = {
            name = "linode-terraform-lke"
        }
    }
  }

provider "kubernetes" {
  host                   = yamldecode(base64decode(data.terraform_remote_state.lke.outputs.kubeconfig)).clusters[0].cluster.server
  token                  = yamldecode(base64decode(data.terraform_remote_state.lke.outputs.kubeconfig)).users[0].user.token
  cluster_ca_certificate = base64decode(yamldecode(base64decode(data.terraform_remote_state.lke.outputs.kubeconfig)).clusters[0].cluster.certificate-authority-data)
}


resource "kubernetes_namespace" "cert" {
  metadata {
    name = "cert-manager"
  }
}