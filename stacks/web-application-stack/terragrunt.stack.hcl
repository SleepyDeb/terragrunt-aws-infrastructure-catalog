# Web Application Stack Terragrunt Configuration

locals {
  environment = "prod"
  version     = "v1.0.0"
}

unit "vpc" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/vpc?ref=${values.version}"
  path   = "units/vpc"
  values = {
    cidr_block  = "10.0.0.0/16"
    environment = local.environment
    version     = local.version
  }
}

unit "alb-sg" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/alb-sg?ref=${values.version}"
  path   = "units/alb-sg"
  values = {
    environment = local.environment
    version     = local.version
    vpc_id      = dependency.vpc.outputs.vpc_id
  }
}

unit "ecs-sg" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/ecs-sg?ref=${values.version}"
  path   = "units/ecs-sg"
  values = {
    environment = local.environment
    version     = local.version
    vpc_id      = dependency.vpc.outputs.vpc_id
  }
}

unit "ec2-sg" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/ec2-sg?ref=${values.version}"
  path   = "units/ec2-sg"
  values = {
    environment = local.environment
    version     = local.version
    vpc_id      = dependency.vpc.outputs.vpc_id
  }
}

unit "sg-rules" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/sg-rules?ref=${values.version}"
  path   = "units/sg-rules"
  values = {
    environment = local.environment
    version     = local.version
    alb_sg_id   = dependency.alb-sg.outputs.security_group_id
    ecs_sg_id   = dependency.ecs-sg.outputs.security_group_id
    ec2_sg_id   = dependency.ec2-sg.outputs.security_group_id
  }
}

unit "alb" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/alb?ref=${values.version}"
  path   = "units/alb"
  values = {
    environment = local.environment
    version     = local.version
    vpc_id      = dependency.vpc.outputs.vpc_id
    alb_sg_id   = dependency.alb-sg.outputs.security_group_id
  }
}

unit "ecs-cluster" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/ecs-cluster?ref=${values.version}"
  path   = "units/ecs-cluster"
  values = {
    environment = local.environment
    version     = local.version
  }
}

unit "ec2-instance" {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//units/ec2-instance?ref=${values.version}"
  path   = "units/ec2-instance"
  values = {
    environment     = local.environment
    version         = local.version
    vpc_id          = dependency.vpc.outputs.vpc_id
    ec2_sg_id       = dependency.ec2-sg.outputs.security_group_id
    instance_type   = "t3.medium"
  }
}