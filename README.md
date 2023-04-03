# waf_customRule_repo
Monorepo for AWS WAF Conformity Rule.

To create and run the rule follow these instructions:

* change into the folder `custom-rule`
* initialize terraform with `terraform init`
* create the following environment variables:
** `export TF_VAR_region=<C1 region>`
** `export TF_VAR_apikey=<C1 API Key>`
* apply the terraform template with `terraform apply`
* Run a Conformity Bot scan in your C1C dashboard
* Under `View By Rule` search for the `CloudWatch` service


