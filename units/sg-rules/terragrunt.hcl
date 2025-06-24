include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/sg-rule?ref=${values.version}"
}

dependency "alb_sg" {
  config_path = "../alb-sg"
  mock_outputs = {
    id = "sg-1234567890"
  }
}

dependency "ecs_sg" {
  config_path = "../ecs-sg"
  mock_outputs = {
    id = "sg-0987654321"
  }
}

dependency "ec2_sg" {
  config_path = "../ec2-sg"
  mock_outputs = {
    id = "sg-1122334455"
  }
}

inputs = {
  alb_sg_id = dependency.alb_sg.outputs.id
  ecs_sg_id = dependency.ecs_sg.outputs.id
  ec2_sg_id = dependency.ec2_sg.outputs.id

  rules = [
    {
      type              = "ingress"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      source_security_group_id = dependency.alb_sg.outputs.id
      target_security_group_id = dependency.ecs_sg.outputs.id
      description       = "Allow ALB to ECS"
    },
    {
      type              = "ingress"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      source_security_group_id = dependency.alb_sg.outputs.id
      target_security_group_id = dependency.ec2_sg.outputs.id
      description       = "Allow ALB to EC2"
    }
  ]
}

outputs = {
  id = terraform.output.id
}