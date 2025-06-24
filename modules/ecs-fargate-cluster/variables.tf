variable "name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "enable_ec2_capacity_provider" {
  description = "Whether to enable EC2 capacity provider in addition to Fargate"
  type        = bool
  default     = false
}

variable "enable_container_insights" {
  description = "Enable CloudWatch Container Insights for the ECS cluster"
  type        = bool
  default     = true
}

variable "log_retention_in_days" {
  description = "Number of days to retain CloudWatch logs for ECS tasks"
  type        = number
  default     = 30
}