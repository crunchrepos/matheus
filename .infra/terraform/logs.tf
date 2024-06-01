resource "aws_cloudwatch_log_group" "boilerplate" {
  name = "/ecs/${var.app_name}-${var.environment}-api"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "container_insights_cluster_performance_log_group" {
  name              = "/aws/ecs/containerinsights/${var.app_name}-${var.environment}-cluster/performance"
  retention_in_days = 14
}