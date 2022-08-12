# Callisto Auth Keycloak
This project exists to allow for unified configuration of deployed callisto keycloak realms.
It uses Terraform to create these configurations, with the main configuration being viewable in the main.tf file, however some values 
are obscured with secrets to maintain the security of the keycloak realms.

# Features
- Full Terraform configuration for any Callisto Keycloak server
- Automated verification of Callisto Keycloak server environments

# Getting Started - Local
--- You must have a local version of the Callisto UI running to proceed with running Terraform ---

- First install terraform from https://www.terraform.io/
- Next clone the repo, and navigate to the config folder
- Next, create a terraform client in keycloak as laid out here under Keycloak Setup: 
https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs
- Then run: terraform init
- Finally run: terraform apply -var="tf_client_id=terraform-client" -var="tf_client_secret=[The keycloak client's secret]"  
-var="tf_realm=callistorealm" -var="tf_url=http://localhost:8080" -var=“callisto_url=http://localhost:3000"

# Scheduled runs
This repository will run both the validate.yaml file, which validates the terraform plan outlined in main.tf to ensure it is formatted and valid, 
and the main.yaml file, which attempts to apply the plan outlined in main.tf and throws an error if the environment does not matched the outlined
one.
