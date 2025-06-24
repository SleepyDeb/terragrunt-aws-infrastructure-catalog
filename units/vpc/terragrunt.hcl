include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/vpc?ref=${values.version}"
}

inputs = {
  cidr_block = values.cidr_block
  azs        = values.azs
  public_subnet_cidrs  = values.public_subnet_cidrs
  private_subnet_cidrs = values.private_subnet_cidrs
  enable_nat_gateway   = values.enable_nat_gateway
}

outputs = {
  vpc_id              = terraform.output.vpc_id
  public_subnet_ids   = terraform.output.public_subnet_ids
  private_subnet_ids  = terraform.output.private_subnet_ids
  nat_gateway_ids     = terraform.output.nat_gateway_ids
}