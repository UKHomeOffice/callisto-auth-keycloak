# Callisto Auth Keycloak

This project contains the configuration that needs to be applied to Callisto's Keycloak realm.

The configuration is held in Terraform so that we can create repeatable deployments across environments.

We currently have 3 GitHub workflows.

- Pushes to branches trigger a workflow flow to validate the terraform and check it's formatting
- Merges into main trigger a workflow that applies the terraform configuration
- A nightly workflow runs a terraform plan with a detailed exit code which causes a failure if any changes are detected

## Local development

If using the callisto-localdev docker compose, stop the keycloak container by running the following command in the localdev repository folder

```
docker compose stop keycloak
```

Then run the following command to spin up a fresh Keycloak container in the localdev environment

```
docker compose up -d
```

At this point you now have a fresh keycloak instance with no callisto realm. To create the realm 
run terraform against this instance to provision the resouces. 

Currently because we use an S3 backend it is probably easier to comment out the backend configuration
so that Terraform defaults to using local state.

Now when `terraform init --reconfigure` is run any existing state held locally will be ignored
so your state will be empty and therefore in sync with the empty Keycloak instance. 

To run the cuurent changes, execute the following commands. *Feel free to export the variables
specified in the command*

```
cd config
terraform init --reconfigure
KEYCLOAK_USER=admin KEYCLOAK_PASSWORD=admin KEYCLOAK_CLIENT_ID=admin-cli KEYCLOAK_URL=http://localhost:50000 terraform apply -var callisto_realm=callisto -var callisto_url=https://web.callisto.localhost -var include_test_users=true
```

Now you can make changes to the config and reapply the terraform config to the keycloak instance

```
KEYCLOAK_USER=admin KEYCLOAK_PASSWORD=admin KEYCLOAK_CLIENT_ID=admin-cli KEYCLOAK_URL=http://localhost:50000 terraform apply -var callisto_realm=callisto -var callisto_url=https://web.callisto.localhost -var include_test_users=true
```

**Test Users**

The keycloak_user resource has an initial password which only works for the initial creation. If you wish to test changes to this you would need to manually delete the user and update the terraform state.

After deleting the user in Keycloak run the following command to see a list of all resources held in terraform state

```
terraform state list
```

Find the test user you wish to remove and then remove it from state
E.g.
```
terraform state rm "module.test_users[0].keycloak_user.tester"
```