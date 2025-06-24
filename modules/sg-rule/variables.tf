variable "type" {
  description = "The type of security group rule (ingress or egress)"
  type        = string
  default     = "ingress"
}

variable "from_port" {
  description = "The start port number of the range"
  type        = number
}

variable "to_port" {
  description = "The end port number of the range"
  type        = number
}

variable "protocol" {
  description = "The protocol to use for the security group rule"
  type        = string
  default     = "tcp"
}

variable "security_group_id" {
  description = "The ID of the security group to apply the rule to"
  type        = string
}

variable "source_security_group_id" {
  description = "The ID of the source security group to apply the rule to"
  type        = string
  default     = null
}

variable "cidr_blocks" {
  description = "The CIDR blocks to apply the rule to"
  type        = list(string)
  default     = []
}

variable "ipv6_cidr_blocks" {
  description = "The IPv6 CIDR blocks to apply the rule to"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the security group rule"
  type        = string
  default     = null
}