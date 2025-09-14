include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:SleepyDeb/terragrunt-aws-infrastructure-catalog.git//modules/vpc-import?ref=${values.version}"
}

inputs = {
  vpc_id = values.vpc_id
}
