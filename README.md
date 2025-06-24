# Terragrunt AWS Infrastructure Catalog

## Catalog Structure

The catalog contains reusable infrastructure components organized into three main categories:

- **Modules**: Reusable Terraform modules that define core infrastructure components such as VPC, ALB, ECS Cluster, EC2 Instances, Security Groups, and Security Group Rules.
- **Units**: Smaller configuration units or building blocks that can be combined within stacks or modules to provide fine-grained infrastructure configurations.

## Unit Configuration Patterns

Units provide reusable, smaller configuration pieces that can be composed to build complex infrastructure stacks. They follow consistent naming and configuration patterns to ensure modularity and reusability.
