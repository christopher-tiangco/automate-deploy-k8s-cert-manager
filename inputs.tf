variable "master_node" {
  description = "k8s master control plane"
  type = object({
    host        = string
    user        = string
    private_key = string
  })
}

variable "cluster_issuer_settings" {
  type = object({
    email                   = string
    name                    = string
    private_key_secret_name = string
  })
}

variable "cloud_flare" {
  type = object({
    api_token_name  = string
    api_token_value = string
    email           = string
  })
}