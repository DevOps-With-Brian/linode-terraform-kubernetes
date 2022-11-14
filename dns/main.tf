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

resource "linode_domain" "master_domain" {
    type = "master"
    domain = var.domain_name
    soa_email = var.soa_email
    tags = var.tags
}


resource "linode_domain_record" "domain_record" {
    domain_id = linode_domain.master_domain.id
    name = var.rasa_dns
    record_type = "A"
    target = var.nodebalancer_ip
}
