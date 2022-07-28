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

data "keycloak_realm" "callisto_notprod_auth" {
  realm = var.tf_realm
}


resource "keycloak_openid_client" "callisto_ui" {
  realm_id  = data.keycloak_realm.callisto_notprod_auth.id
  client_id = "terraform-client"
  name      = "Callisto SPA"
  enabled   = true

  access_type = "PUBLIC"

  standard_flow_enabled        = true
  direct_access_grants_enabled = false
  service_accounts_enabled     = false
  root_url                     = var.base_url
  admin_url                    = var.base_url
  web_origins = [
    var.base_url
  ]
  valid_redirect_uris = [
    "/*"
  ]
}