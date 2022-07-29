terraform {
  backend "s3" {
    key = "terraform/build/callisto-auth-keycloak"
  }
}

provider "keycloak" {
  # Variables in here must be defined locally before running the plan
  client_id     = var.tf_client_id
  client_secret = var.tf_client_secret
  realm         = var.tf_realm
  url           = var.tf_url
}