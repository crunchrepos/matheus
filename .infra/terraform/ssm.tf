data "aws_ssm_parameter" "db_password" {
  name            = var.db_password_parameter
  with_decryption = true
}