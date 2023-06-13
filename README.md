# cloud-armor
Terraform deployment for Cloud Armor

This code is not ment to be used in a production environment!
Please review before usage.

## Policy options
The policy is provided with default settings, how can be modified using the variables.tf file: 
- json_parsing = DISABLED
- log_level = VERBOSE

## Provisioned Rules
The rules are based on the owasp modsecurity CRS 3.3:
- Default rule
- OWASP Top 10
- Rate Limiting
- Cves and vulnerabilities (Log4J and Json-SQLi)
- Geo fencing

All rules (except the default one) are deployed in Preview mode (without impact on the workload), don't forget to remove the preview mode to block real traffic.

## Limitation
- The Global Load-balancer is not provisionned via this terraform. You need to take care of this part, manually, via Gcloud or via terraform
- If your endpoint if a JSON endpoint, be sure your enforce JSON-PARSING, otherwise, the WAF expression may not be able to get their jobs done properly

## Provision infrastructure
```
terraform init
terraform plan
terraform apply -auto-approve
```

![Cloud Armor](assets/cloud-armor.png)