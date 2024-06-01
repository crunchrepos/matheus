resource "aws_alb" "main" {
  name            = "${var.app_name}-alb"
  subnets         = module.vpc.public_subnets.ids
  security_groups = [aws_security_group.alb_sg.id]
}