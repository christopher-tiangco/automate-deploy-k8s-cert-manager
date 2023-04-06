# Deploying cert-manager to Kubernetes cluster via Terraform

Terraform configuration for deploying cert-manager to Kubernetes cluster (Rancher's k3s)


## Prerequisites
- Terraform CLI
- Running Kubernetes cluster
- The host that's running the Terraform CLI can SSH to the master node without using a password

## Important
- This configuration was verified to work after provisioning a k3s cluster via https://github.com/christopher-tiangco/automate-k8s-cluster
- Make sure to add an `inputs.tfvars` file (which is set to be ignored by the repository) for setting the server target. Below is the format:
```
master_node = {
  host        = "ip address of the master node"
  private_key = "path/filename of the ssh private key for root user"
  user        = "root"
}

cluster_issuer_settings = {
  email                   = "email address to use for Let's Encrypt"
  name                    = "letsencrypt-nginx"
  private_key_secret_name = "letsencrypt-nginx-private-key"
}

cloud_flare = {
  api_token_name  = "the name of the api token created at Cloudflare"
  api_token_value = "the api token value from Cloudflare"
  email           = "cloudflare account email address"
}
```

- To run the configuration, simply do the following commands
```
terraform init
terraform apply -var-file="inputs.tfvars"
```
