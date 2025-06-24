# ECS Cluster Module

This module creates an ECS cluster with Fargate capacity providers, optional EC2 capacity provider, and a CloudWatch log group for ECS tasks.

## Usage

```hcl
module "ecs_cluster" {
  source = "path/to/terragrunt-aws-infrastructure-catalog/modules/ecs-cluster"

  name                      = "my-ecs-cluster"
  enable_ec2_capacity_provider = false
  enable_container_insights = true
  log_retention_in_days     = 30
}
```

## Inputs

| Name                      | Description                                         | Type    | Required |
|---------------------------|-----------------------------------------------------|---------|----------|
| name                      | The name of the ECS cluster                          | string  | yes      |
| enable_ec2_capacity_provider | Whether to enable EC2 capacity provider            | bool    | no       |
| enable_container_insights | Enable CloudWatch Container Insights for the cluster | bool    | no       |
| log_retention_in_days     | Number of days to retain CloudWatch logs            | number  | no       |

## Outputs

| Name                   | Description                          |
|------------------------|------------------------------------|
| ecs_cluster_id         | The ID of the ECS cluster           |
| ecs_cluster_arn        | The ARN of the ECS cluster          |
| cloudwatch_log_group_name | The name of the CloudWatch log group for ECS tasks |