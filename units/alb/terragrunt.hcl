include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/alb?ref=${values.version}"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    public_subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}

dependency "alb_sg" {
  config_path = "../alb-sg"
  mock_outputs = {
    id = "sg-1234567890"
  }
}

inputs = {
  name               = values.name
  vpc_id             = dependency.vpc.outputs.vpc_id
  public_subnet_ids  = dependency.vpc.outputs.public_subnet_ids
  security_group_ids = [dependency.alb_sg.outputs.id]
}

outputs = {
  alb_dns_name = terraform.output.dns_name
  alb_arn      = terraform.output.arn
  alb_id       = terraform.output.id
}