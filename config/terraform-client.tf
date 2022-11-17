resource "keycloak_openid_client" "terraform_openid_client_callisto" {
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      client_secret
    ]
  }

  realm_id = keycloak_realm.callisto.id

  client_id = "terraform-client"
  name      = "Terraform client Callisto"
  enabled   = true

  access_type                              = "CONFIDENTIAL"
  exclude_session_state_from_auth_response = false
  standard_flow_enabled                    = false
  direct_access_grants_enabled             = false
  service_accounts_enabled                 = true

}

data "keycloak_openid_client" "realm_management" {
  realm_id  = var.callisto_realm
  client_id = "realm-management"
}

locals {
  roles = [
    "manage-realm",
    "realm-admin"
  ]
}

data "keycloak_role" "required" {
  for_each  = toset(local.roles)
  realm_id  = keycloak_realm.callisto.id
  client_id = data.keycloak_openid_client.realm_management.id
  name      = each.key
}

resource "keycloak_openid_client_service_account_role" "client2_service_account_role" {
  lifecycle {
    prevent_destroy = true
  }
  for_each                = data.keycloak_role.required
  realm_id                = data.keycloak_openid_client.realm_management.realm_id
  service_account_user_id = keycloak_openid_client.terraform_openid_client_callisto.service_account_user_id
  client_id               = data.keycloak_openid_client.realm_management.id
  role                    = each.value.name
}
