# VPC Module

This module creates a VPC with public and private subnets across multiple availability zones, an Internet Gateway, NAT Gateways for private subnet egress, route tables, and DNS hostnames and resolution enabled.

## Usage

```hcl
module "vpc" {
  source = "path/to/terragrunt-aws-infrastructure-catalog/modules/vpc"

  name                = "my-vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  eip_allocation_ids  = [aws_eip.nat1.id, aws_eip.nat2.id, aws_eip.nat3.id]
}
```

## Inputs

| Name                | Description                                         | Type          | Required |
|---------------------|-----------------------------------------------------|---------------|----------|
| name                | The name prefix for all resources                   | string        | yes      |
| vpc_cidr_block      | The CIDR block for the VPC                           | string        | yes      |
| availability_zones  | List of availability zones to use for subnets       | list(string)  | yes      |
| public_subnet_cidrs | List of CIDR blocks for public subnets, one per AZ  | list(string)  | yes      |
| private_subnet_cidrs| List of CIDR blocks for private subnets, one per AZ | list(string)  | yes      |
| eip_allocation_ids  | List of Elastic IP allocation IDs for NAT Gateways  | list(string)  | yes      |

## Outputs

| Name                | Description                      |
|---------------------|---------------------------------|
| vpc_id              | The ID of the VPC               |
| public_subnet_ids   | List of public subnet IDs        |
| private_subnet_ids  | List of private subnet IDs       |
| internet_gateway_id | The ID of the Internet Gateway   |
| nat_gateway_ids     | List of NAT Gateway IDs          |
| public_route_table_id | The ID of the public route table |
| private_route_table_id | The ID of the private route table |