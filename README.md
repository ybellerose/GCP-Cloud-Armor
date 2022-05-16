# cloud-armor
Terraform deployment for Cloud Armor

Default rule, OWASP Top 10, Rate limiting and Log4j rules are provisied
All rules (except the default one) are deploy in Preview mode (without impact on the workload)

The Global Load-balancer is not provisinned via this terraform.

This code is not ment to be used in a production environment!
Please review before usage.

## Provision infrastructure
```
terraform init
terraform plan
terraform apply -auto-approve
```