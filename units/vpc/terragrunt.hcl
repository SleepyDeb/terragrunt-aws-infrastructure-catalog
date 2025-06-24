include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/vpc?ref=${values.version}"
}

inputs = {
  vpc_cidr            = values.vpc_cidr
  vpc_azs             = values.vpc_azs
  vpc_public_subnets  = values.vpc_public_subnets
  vpc_private_subnets = values.vpc_private_subnets
}
