variable "base_url" {
  type        = string
  description = "The base url for the keycloak server to target"
  sensitive   = true
}

variable "client_id" {
  type        = string
  description = "The id of the client to be created"
  sensitive   = true
}

variable "client_name" {
  type        = string
  description = "The name of the client to be created"
  sensitive   = true
}

variable "tf_client_id" {
  type        = string
  description = "The name of the client to be created"
  sensitive   = true
}

variable "tf_client_secret" {
  type        = string
  description = "The name of the client to be created"
  sensitive   = true
}

variable "tf_realm" {
  type        = string
  description = "The name of the client to be created"
  sensitive   = true
}

variable "tf_url" {
  type        = string
  description = "The name of the client to be created"
  sensitive   = true
}

