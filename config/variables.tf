variable "tf_client_id" {
  type        = string
  description = "The id of the keycloak client to be used to perform the terraform actions"
  sensitive   = true
}

variable "tf_client_secret" {
  type        = string
  description = "The secret of the keycloak client to be used to perform the terraform actions"
  sensitive   = true
}

variable "tf_realm" {
  type        = string
  description = "The realm of the keycloak instance to perform the terraform actions on"
  sensitive   = true
}

variable "tf_url" {
  type        = string
  description = "The url of the keycloak instance to perform the terraform actions on"
  sensitive   = true
}

variable "callisto_url" {
  type        = string
  description = "The url of the callisto server"
  sensitive   = true
}