resource "keycloak_user" "tester" {
  realm_id = var.callisto_realm
  username = "tester"
  enabled  = true

  email      = "tester@homeoffice.gov.uk"
  first_name = "Tess"
  last_name  = "Terr"

  initial_password {
    value     = "password"
    temporary = false
  }
}