resource "aws_ecr_repository" "api" {
  name = "${var.app_name}-${var.environment}-api"
  force_delete = var.ecr_allow_force_delete
  image_tag_mutability = "MUTABLE"
}

