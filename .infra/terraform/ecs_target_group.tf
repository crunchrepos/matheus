resource "aws_alb_target_group" "boilerplate" {
  name                          = "${var.app_name}-${var.environment}"
  port                          = var.app_port
  protocol                      = "HTTP"
  vpc_id                        = module.vpc.vpc_id
  target_type                   = "ip"
  load_balancing_algorithm_type = "round_robin"
  slow_start                    = 30

  health_check {
    healthy_threshold   = "2"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "10"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [ aws_alb.main ]
}

resource "aws_alb_listener" "public_listener" {
  load_balancer_arn = aws_alb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.boilerplate.arn
    type             = "forward"
  }

  depends_on = [ aws_alb_target_group.boilerplate ]
}
