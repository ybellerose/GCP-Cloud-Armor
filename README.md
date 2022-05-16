# cloud-armor
Terraform deployment for Cloud Armor

Default rule, OWASP Top 10, Rate limiting and Log4j rules are provisied
All rules (except the default one) are deployed in Preview mode (without impact on the workload)

The Global Load-balancer is not provisionned via this terraform. You need to take care of this part, manually, via Gcloud or via terraform

This code is not ment to be used in a production environment!
Please review before usage.

## Provision infrastructure
```
terraform init
terraform plan
terraform apply -auto-approve
```
