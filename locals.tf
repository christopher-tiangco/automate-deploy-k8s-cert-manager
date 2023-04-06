locals {
  k3s_master_node_url        = "https://${var.master_node.host}:6443"
  k3s_cluster_ca_certificate = base64decode(yamldecode(data.remote_file.kubeconfig.content).clusters[0].cluster.certificate-authority-data)
  k3s_client_certificate     = base64decode(yamldecode(data.remote_file.kubeconfig.content).users[0].user.client-certificate-data)
  k3s_client_key             = base64decode(yamldecode(data.remote_file.kubeconfig.content).users[0].user.client-key-data)
  cloud_flare_secret_key     = "api-token"
}