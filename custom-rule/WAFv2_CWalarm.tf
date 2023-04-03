terraform {
  required_providers {
    conformity = {
      version = "~> 0.5.0"
      source  = "trendmicro/conformity"
    }
  }
}

provider "conformity" {
  region = var.region
  apikey = var.apikey
}

resource "conformity_custom_rule" "awswaf_cwalarm"{
          name= "CloudWatch Alarm detecting AWS WAFv2 blocking events"
          description      = "TEnsure there is a CloudWatch alarm whenever AWS WAFv2 blocks requests"
            remediation_notes = "Review blocking events and update WebACLs as needed"
            service          = "CloudWatch"
            resource_type     = "cw-alarm"
            categories       = ["security"]
            severity         = "HIGH"
            cloud_provider   = "aws"
            enabled          = true
            attributes {
                name = "Namespace"
                path = "data.Namespace"
                required = true
            }
            attributes {
                name = "MetricName"
                path = "data.MetricName"
                required = true
            }

              rules {
                operation = "all"
                conditions {
                  fact     = "Namespace"
                  operator = "equal"
                  value    = "AWS/WAFV2"
                }
                conditions {
                  fact     = "MetricName"
                  operator = "equal"
                  value    = "BlockedRequests"
                }
                event_type = "AWS WAFv2 CloudWatch Alarm has been created"
              }
  }