data "aws_ecr_repository" "api" {
  name = "${var.app_name}-api-${var.environment}"
}