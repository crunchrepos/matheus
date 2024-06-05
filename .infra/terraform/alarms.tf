resource "aws_sns_topic" "alarm_notifications" {
  name = "${var.app_name}-${var.environment}-alarm-notification"
}

resource "aws_sns_topic_subscription" "alarm_email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.alarm_email_subscription
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu-alarm-${var.environment}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    ClusterName = aws_ecs_cluster.default.name
    ServiceName = aws_ecs_service.boilerplate.name
  }

  alarm_description = "This alarm monitors CPU utilization"
  actions_enabled   = true
  alarm_actions     = [aws_sns_topic.alarm_notifications.arn]
}

output "sns_topic_arn" {
  value = aws_sns_topic.alarm_notifications.arn
}

output "cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.cpu_alarm.arn
}