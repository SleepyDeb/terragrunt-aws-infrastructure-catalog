output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "The Name of the VPC"
  value       = module.vpc.vpc_name
}