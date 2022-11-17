# Callisto Auth Keycloak

This project contains the configuration that needs to be applied to Callisto's Keycloak realm.

The configuration is held in Terraform so that we can create repeatable deployments across environments.

We currently have 3 GitHub workflows.

- Pushes to branches trigger a workflow flow to validate the terraform and check it's formatting
- Merges into main trigger a workflow that applies the terraform configuration
- A nightly workflow runs a terraform plan with a detailed exit code which causes a failure if any changes are detected
