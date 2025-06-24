variable "name" {
  description = "The name prefix for all resources"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener. If empty, HTTPS listener is not created"
  type        = string
  default     = ""
}