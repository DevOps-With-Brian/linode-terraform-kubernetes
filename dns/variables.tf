variable "token" {
    description = "Your Linode API Personal Access Token. (required)"
}

variable "nodebalancer_ip" {
    description = "The nodebalancer public ip address to use for dns records."
}

variable "domain_name" {
    description = "The domain name to create/modify"
}

variable "soa_email" {
    description = "The start of authority email address."
}

variable "rasa_dns" {
    description = "The subdomain name to use for rasa_dns record"
    default = "rasa"
}

variable "tags" {
    description = "Tags to apply to domain"
    type = list(string)
    default = ["prod"]
}