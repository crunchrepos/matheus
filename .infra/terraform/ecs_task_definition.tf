# Data source to retrieve the latest image from ECR
data "aws_ecr_image" "latest_image" {
  repository_name = aws_ecr_repository.api.name
  most_recent     = true

  depends_on = [ aws_ecr_repository.api ]
}

resource "aws_ecs_task_definition" "ecs_tasks" {
  family             = "${var.app_name}-${var.environment}"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_execution_role.arn

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_fargate_cpu
  memory                   = var.ecs_fargate_memory

  runtime_platform {
    cpu_architecture         = "X86_64"
    operating_system_family  = "LINUX"
  }

  container_definitions = templatefile("./tasks/boilerplate.tftpl", {
    # app api
    api_cpu        = var.app_container_cpu
    api_memory     = var.app_container_memory
    app_image      = data.aws_ecr_image.latest_image.image_uri
    app_name       = var.app_name
    app_port       = var.app_port
    log_group      = aws_cloudwatch_log_group.boilerplate.name
    aws_region     = var.aws_region
    jwt_secret     = data.aws_ssm_parameter.jwt_secret.value
    jwt_expiration = var.app_jwt_expiration

    # database
    db_hostname       = module.rds_postgres_db.db_instance_endpoint
    db_port           = var.db_postgres_port
    db_username       = var.db_username
    db_password       = data.aws_ssm_parameter.db_password.value
    db_database_name  = var.db_database_name
  })

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_cloudwatch_log_group.boilerplate]
}

