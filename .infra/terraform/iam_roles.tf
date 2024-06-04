resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.app_name}-${var.environment}-ecs_task_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "ecs_task_execution_policy" {
  name        = "${var.app_name}-${var.environment}-ecs_task_execution_policy"
  description = "Policy for ECS task execution role"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "autoscaling:*",
        "cloudwatch:*",
        "ec2:*",
        "ec2messages:*",
        "ecs:*",
        "elasticloadbalancing:*",
        "events:*",
        "kms:*",
        "logs:*",
        "rds:*",
        "secretsmanager:*",
        "ssm:*",
        "sts:AssumeRole",
        "application-autoscaling:*",
        "ecr:*"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}

