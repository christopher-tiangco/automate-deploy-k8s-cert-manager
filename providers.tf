terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.19.0"
    }
    remote = {
      source  = "tenstad/remote"
      version = "0.1.1"
    }
  }
}

provider "remote" {}
provider "kubernetes" {
  host                   = local.k3s_master_node_url
  cluster_ca_certificate = local.k3s_cluster_ca_certificate
  client_certificate     = local.k3s_client_certificate
  client_key             = local.k3s_client_key
}
provider "helm" {
  kubernetes {
    host                   = local.k3s_master_node_url
    cluster_ca_certificate = local.k3s_cluster_ca_certificate
    client_certificate     = local.k3s_client_certificate
    client_key             = local.k3s_client_key
  }
}
provider "kubectl" {
  host                   = local.k3s_master_node_url
  cluster_ca_certificate = local.k3s_cluster_ca_certificate
  client_certificate     = local.k3s_client_certificate
  client_key             = local.k3s_client_key
}