# Security Group (SG) Module

This module creates a configurable security group with flexible ingress and egress rules in a specified VPC.

## Usage

```hcl
module "sg" {
  source = "path/to/terragrunt-aws-infrastructure-catalog/modules/sg"

  name        = "my-security-group"
  description = "Security group for my application"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks              = ["0.0.0.0/0"]
      description              = "Allow HTTP inbound"
    }
  ]

  egress_rules = [
    {
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0"]
      description              = "Allow all outbound"
    }
  ]
}
```

## Inputs

| Name          | Description                          | Type          | Required |
|---------------|------------------------------------|---------------|----------|
| name          | The name of the security group     | string        | yes      |
| description   | Description of the security group  | string        | no       |
| vpc_id        | The VPC ID where the SG will be created | string    | yes      |
| ingress_rules | List of ingress rules              | list(object)  | no       |
| egress_rules  | List of egress rules               | list(object)  | no       |

## Outputs

| Name | Description                  |
|------|------------------------------|
| id   | The ID of the security group |
| name | The name of the security group |
| arn  | The ARN of the security group |