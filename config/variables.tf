variable "callisto_realm" {
  type        = string
  description = "The keycloak realm for callisto"
  sensitive   = true
}

variable "callisto_realm_display_name" {
  type        = string
  description = "The display name for the realm that is shown when logging in to the admin console."
  sensitive   = false
}

variable "callisto_url" {
  type        = string
  description = "The website url for callisto"
  sensitive   = true
}