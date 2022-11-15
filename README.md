# Callisto Auth Keycloak

This project contains the configuration that needs to be applied to Callisto's Keycloak realm.

The configuration is held in Terraform so that we can create repeatable deployments across environments.

We currently have 3 GitHub workflows.

- Pushes to branches trigger a workflow flow to validate the terraform and check it's formatting
- Merges into main trigger a workflow that applies the terraform configuration
- A nightly workflow runs a terraform plan with a detailed exit code which causes a failure if any changes are detected

## Testing changes from your local before raising PR

We’ve developed a habit of testing our changes in dev before raising them as a PR.

You will need:

- `brew install terraform`
- access to our k8s secrets to see the `ho-callisto-terraform-s3` secrets for configuring the back-end
- The AWS cli

Steps:

1. `cd config`

1. `terraform init`
   …

2. See what you’re changing with `terraform plan`:

```
KEYCLOAK_CLIENT_ID=terraform-client \
KEYCLOAK_CLIENT_SECRET=[redacted] \
KEYCLOAK_REALM=callisto-dev \
KEYCLOAK_URL="https://sso-dev.notprod.homeoffice.gov.uk" \
TF_VAR_callisto_realm=callisto-dev \
TF_VAR_callisto_url=https://web.dev.callisto.homeoffice.gov.uk \
terraform plan
```
