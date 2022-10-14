variable "callisto_realm" {
  type        = string
  description = "The keycloak realm for callisto"
  sensitive   = true
}

variable "callisto_url" {
  type        = string
  description = "The website url for callisto"
  sensitive   = true
}