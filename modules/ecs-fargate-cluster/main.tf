resource "aws_ecs_cluster" "this" {
  name = var.name

  capacity_providers = var.enable_ec2_capacity_provider ? ["FARGATE", "FARGATE_SPOT", "EC2"] : ["FARGATE", "FARGATE_SPOT"]

  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? "enabled" : "disabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs_tasks" {
  name              = "/ecs/${var.name}"
  retention_in_days = var.log_retention_in_days
  tags = {
    Name = "${var.name}-ecs-tasks-log-group"
  }
}