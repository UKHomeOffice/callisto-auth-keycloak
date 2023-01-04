output "realm_id" {
  value = keycloak_realm.callisto.id
}

output "react_client_id" {
  value = keycloak_openid_client.react_client.id
}

