resource "aws_appautoscaling_target" "boilerplate" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.default.name}/${aws_ecs_service.boilerplate.name}"
  scalable_dimension = "ecs:service:DesiredCount"

  min_capacity = var.ecs_autoscaling_min_size
  max_capacity = var.ecs_autoscaling_max_size

  depends_on = [aws_ecs_service.boilerplate]
}

resource "aws_appautoscaling_policy" "boilerplate_up" {
  name               = "${var.app_name}_scale_up_${var.environment}"
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.default.name}/${aws_ecs_service.boilerplate.name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 2
    }
  }

  depends_on = [aws_appautoscaling_target.boilerplate]
}

resource "aws_appautoscaling_policy" "boilerplate_down" {
  name               = "${var.app_name}_scale_down_${var.environment}"
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.default.name}/${aws_ecs_service.boilerplate.name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.boilerplate]
}

resource "aws_cloudwatch_metric_alarm" "boilerplate_service_cpu_high" {
  alarm_name          = "${var.app_name}_cpu_high_${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "30"
  statistic           = "Maximum"
  threshold           = "50"

  dimensions = {
    ClusterName = aws_ecs_cluster.default.name
    ServiceName = aws_ecs_service.boilerplate.name
  }

  alarm_actions = [aws_appautoscaling_policy.boilerplate_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "boilerplate_service_cpu_low" {
  alarm_name          = "${var.app_name}_cpu_low_${var.environment}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "30"

  dimensions = {
    ClusterName = aws_ecs_cluster.default.name
    ServiceName = aws_ecs_service.boilerplate.name
  }

  alarm_actions = [aws_appautoscaling_policy.boilerplate_down.arn]
}

resource "aws_cloudwatch_metric_alarm" "boilerplate_service_memory_high" {
  alarm_name          = "${var.app_name}_memory_high_${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "30"
  statistic           = "Maximum"
  threshold           = "50"

  dimensions = {
    ClusterName = aws_ecs_cluster.default.name
    ServiceName = aws_ecs_service.boilerplate.name
  }

  alarm_actions = [aws_appautoscaling_policy.boilerplate_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "boilerplate_service_memory_low" {
  alarm_name          = "${var.app_name}_memory_low_${var.environment}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "30"

  dimensions = {
    ClusterName = aws_ecs_cluster.default.name
    ServiceName = aws_ecs_service.boilerplate.name
  }

  alarm_actions = [aws_appautoscaling_policy.boilerplate_down.arn]
}