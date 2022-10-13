terraform {
  backend "s3" {
    key = "terraform/build/callisto-auth-keycloak"
  }
}

provider "keycloak" {
  # Variables in here must be defined locally before running the plan
}