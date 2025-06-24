# Terragrunt AWS Infrastructure Catalog

## Catalog Structure

The catalog contains reusable infrastructure components organized into three main categories:

- **Modules**: Reusable Terraform modules that define core infrastructure components such as VPC, ALB, ECS Cluster, EC2 Instances, Security Groups, and Security Group Rules.
- **Stacks**: Compositions of modules that represent deployable infrastructure stacks tailored for specific applications or services.
- **Units**: Smaller configuration units or building blocks that can be combined within stacks or modules to provide fine-grained infrastructure configurations.

## Available Modules and Their Purposes

- **VPC**: Creates the Virtual Private Cloud with public and private subnets, NAT Gateway, and routing.
- **ALB (Application Load Balancer)**: Sets up the ALB in public subnets with listeners and target groups.
- **ECS Cluster**: Manages the ECS cluster for container orchestration.
- **EC2 Instance**: Provisions EC2 instances for additional compute resources.
- **Security Groups (SG)**: Defines security groups for controlling network access.
- **Security Group Rules (SG-Rule)**: Defines individual security group rules for fine-grained access control.

## Unit Configuration Patterns

Units provide reusable, smaller configuration pieces that can be composed to build complex infrastructure stacks. They follow consistent naming and configuration patterns to ensure modularity and reusability.

## Stack Orchestration

Stacks orchestrate multiple modules and units to form complete infrastructure deployments. They define dependencies and configuration inheritance to enable environment-specific customization and promote DRY (Don't Repeat Yourself) principles.

## Development and Contribution Guidelines

- Follow existing module and unit patterns for consistency.
- Pin module and provider versions to maintain stability.
- Write clear and concise documentation for new modules or stacks.
- Test changes in non-production environments before promoting to production.
- Use Terragrunt's dependency management features to handle inter-module dependencies.
- Submit pull requests with detailed descriptions and rationale for changes.

---

This catalog serves as the foundation for building and managing AWS infrastructure using Terragrunt and Terraform. For live environment configurations and deployment instructions, refer to the `terragrunt-aws-infrastructure-live-stacks` directory.