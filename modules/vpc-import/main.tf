# INPUT VARIABLES
variable "vpc_id" {
  description = "The VPC ID to import"
  type        = string
}

# INPUT VARIABLES
variable "default" {
  description = "Should import the default VPC if no VPC ID is provided"
  type        = bool
  default     = false
}


# RESOURCE DEFINITIONS
# reference: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "vpc" {
  id = var.vpc_id
  default = var.default
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

# OUTPUTS
output "vpc_id" {
  description = "The ID of the VPC"
  value       = data.aws_vpc.vpc.id
}

output "vpc_name" {
  description = "The Name of the VPC"
  value       = lookup(data.aws_vpc.vpc.tags, "name", null)
}

output "vpc_subnet_ids" {
  description = "List of all Subnet IDs"
  value       = data.aws_subnets.subnets.ids
}

output "vpc_subnets" {
  description = "List of all Subnets"
  value       = data.aws_subnet.subnets
}
