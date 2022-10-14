# Callisto Auth Keycloak
This project contains the configuration that needs to be applied to Callisto's Keycloak realm.

The configuration is held in Terraform so that we can create repeatable deployments across environments.


We have 3 GitHub workflows. We validate the terraform configuration on pushes to feature branches and on pull requests. We apply configuration when it is pushed to main. Finally, we run a daily schedule to detect drift between the defined configuration and the deployed resources.

