# waf_customRule_repo
Monorepo for AWS WAF Conformity Rule.

To create and run the rule follow these instructions:

* change into the folder `custom-rule`
* initialize terraform with `terraform init`
* create the following environment variables:
  * `export TF_VAR_region=<C1 region>`
  * `export TF_VAR_apikey=<C1 API Key>`
* apply the terraform template with `terraform apply`
* Run a Conformity Bot scan in your C1C dashboard
* Under `View By Rule` search for the `CloudWatch` service
* Scroll down to the results and look for `CloudWatch Alarm detecting AWS WAFv2 Blocking events`

# Caveats
This is a work in progress and further work is needed removing findings from other services.

