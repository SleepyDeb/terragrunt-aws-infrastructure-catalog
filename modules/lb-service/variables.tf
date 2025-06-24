
variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "capacity_provider_name" {
  description = "ECS Capacity Provider Name"
  type        = string  
}