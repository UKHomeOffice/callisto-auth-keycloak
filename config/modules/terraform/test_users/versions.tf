terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 3.8.1"
    }
  }
  required_version = ">=0.15"
}