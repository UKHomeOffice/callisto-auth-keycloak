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

resource "keycloak_user" "callistouser" {
  realm_id = var.callisto_realm
  username = "callistouser"
  enabled  = true

  email      = "callistouser@homeoffice.gov.uk"
  first_name = "Callisto"
  last_name  = "User"

  initial_password {
    value     = "password123"
    temporary = false
  }
}