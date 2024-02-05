resource "aws_secretsmanager_secret" "test_secret"{
    name = "test_secret"
    description = "test out secrets through terraform"
}
resource "aws_secretsmanager_secret_version" "username" {
  secret_id     = aws_secretsmanager_secret.test_secret.id
  secret_string = jsonencode({
    "username": var.username,
    "password" = var.password
  })
}
