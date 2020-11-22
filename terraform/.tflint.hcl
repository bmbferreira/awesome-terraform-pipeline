config {
  module = true
  deep_check = true
  force = false
  disabled_by_default = false
}

rule "terraform_module_pinned_source" {
  enabled = true
  style = "semver"
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}
