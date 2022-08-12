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

resource "callisto" "realm" {
  realm                       = var.tf_realm
  enabled                     = true
  display_name                = ""
  display_name_html           = ""
  default_signature_algorithm = "RS256"

  access_code_lifespan = "1m0s"

  ssl_required = "external"

  security_defenses {
    headers {
      x_frame_options                     = "SAMEORIGIN"
      content_security_policy             = "frame-src 'self'; frame-ancestors 'self' ${var.callisto_url}; object-src 'none';"
      content_security_policy_report_only = ""
      x_content_type_options              = "nosniff"
      x_robots_tag                        = "none"
      x_xss_protection                    = "1; mode=block"
      strict_transport_security           = "max-age=31536000; includeSubDomains"
    }
  }

  web_authn_policy {
    relying_party_entity_name = "keycloak"
    signature_algorithms      = ["ES256"]
  }
}