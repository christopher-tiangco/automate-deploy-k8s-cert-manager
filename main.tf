module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = var.cluster_issuer_settings.email
  cluster_issuer_name                    = var.cluster_issuer_settings.name
  cluster_issuer_private_key_secret_name = var.cluster_issuer_settings.private_key_secret_name
  solvers = [
    {
      dns01 = {
        cloudflare = {
          apiTokenSecretRef = {
            key  = local.cloud_flare_secret_key
            name = var.cloud_flare.api_token_name
          }
          email = var.cloud_flare.email
        }
      }
    }
  ]
}

resource "kubernetes_secret" "cloud_flare_api_token" {
  metadata {
    name      = var.cloud_flare.api_token_name
    namespace = "cert-manager"
  }

  data = {
    (local.cloud_flare_secret_key) = var.cloud_flare.api_token_value
  }
}