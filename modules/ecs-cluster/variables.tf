variable "name" {
  description = "The name prefix for all resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where to deploy the cluster"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Architecture = "Sample Architecture"
  }
}


variable "node_group_instance_types" {
  description = "EC2 instance types for the ECS node group"
  type        = string
  default     = ["t3.small"]
}

variable "node_group_desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}