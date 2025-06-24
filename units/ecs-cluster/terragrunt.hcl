include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::git@github.com:org/aws-infrastructure-catalog.git//modules/ecs-cluster?ref=${values.version}"
}

inputs = {
  cluster_name = values.cluster_name

  cloudwatch_log_group_name = values.cloudwatch_log_group_name
  cloudwatch_log_retention_in_days = values.cloudwatch_log_retention_in_days
}