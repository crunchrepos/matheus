resource "aws_ecs_service" "boilerplate" {
  name            = var.app_name
  cluster         = aws_ecs_cluster.default.id
  desired_count   = var.app_count_boilerplate
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.ecs_tasks.arn
  force_new_deployment = true

  network_configuration {
    security_groups = [aws_security_group.ecs_tasks.id]
    subnets         = module.vpc.private_subnets
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.boilerplate.arn
    container_name   = var.app_name
    container_port   = var.app_port
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_ecs_task_definition.ecs_tasks, aws_alb_listener.public_listener]
}


