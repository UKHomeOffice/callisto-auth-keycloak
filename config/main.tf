terraform {
  backend "s3" {
  }
}

provider "keycloak" {
  # Variables in here must be defined locally before running the plan
}


resource "keycloak_realm" "callisto" {
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
        display_name
    ]
  }
  realm        = var.callisto_realm
  enabled      = true

  access_code_lifespan = "1m0s"

  ssl_required = "external"

  login_theme = "govuk"

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