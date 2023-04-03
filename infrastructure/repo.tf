terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.18.3"
    }
  }
}

provider "github" {
  token = var.gh_token
}

resource "github_repository" "waf_customRule_repo" {
  name        = "waf_customRule_repo"
  description = "Monorepo for AWS WAF Conformity RUle"
  visibility = "public"
  has_issues = true
  has_discussions = true
  auto_init = true
  license_template = "mit"
}