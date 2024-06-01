data "aws_ssm_parameter" "db_password" {
  name            = "/${var.environment}/crunch/db/password"
  with_decryption = true
}

data "aws_ssm_parameter" "jwt_secret" {
  name = "/${var.environment}/crunch/app/jwt_secret"
  with_decryption = true
}

