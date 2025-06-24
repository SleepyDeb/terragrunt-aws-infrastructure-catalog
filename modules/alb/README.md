# Application Load Balancer (ALB) Module

This module creates an Application Load Balancer (ALB) in public subnets with target groups for HTTP and HTTPS traffic. It supports security group integration and optional SSL certificate for HTTPS.

## Usage

```hcl
module "alb" {
  source = "path/to/terragrunt-aws-infrastructure-catalog/modules/alb"

  name               = "my-alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  security_group_ids  = [aws_security_group.alb_sg.id]
  ssl_certificate_arn = "arn:aws:acm:region:account:certificate/your-cert-id" # Optional
}
```

## Inputs

| Name               | Description                                         | Type          | Required |
|--------------------|-----------------------------------------------------|---------------|----------|
| name               | The name prefix for all resources                   | string        | yes      |
| vpc_id             | The ID of the VPC where the ALB will be deployed    | string        | yes      |
| public_subnet_ids  | List of public subnet IDs for the ALB                | list(string)  | yes      |
| security_group_ids  | List of security group IDs to associate with the ALB| list(string)  | yes      |
| ssl_certificate_arn | ARN of the SSL certificate for HTTPS listener. If empty, HTTPS listener is not created | string | no |

## Outputs

| Name                 | Description                      |
|----------------------|---------------------------------|
| alb_arn              | The ARN of the Application Load Balancer |
| alb_dns_name         | The DNS name of the Application Load Balancer |
| alb_security_group_ids| The security group IDs associated with the ALB |
| http_target_group_arn| The ARN of the HTTP target group |
| https_target_group_arn| The ARN of the HTTPS target group, if created |