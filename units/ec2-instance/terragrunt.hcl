include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/ec2-instance?ref=${values.version}"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    private_subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}

dependency "ec2_sg" {
  config_path = "../ec2-sg"
  mock_outputs = {
    id = "sg-1234567890"
  }
}

inputs = {
  name               = values.name
  ami_id             = values.ami_id
  instance_type      = values.instance_type
  subnet_ids         = dependency.vpc.outputs.private_subnet_ids
  security_group_ids = [dependency.ec2_sg.outputs.id]
  key_name           = values.key_name
  user_data          = values.user_data
}