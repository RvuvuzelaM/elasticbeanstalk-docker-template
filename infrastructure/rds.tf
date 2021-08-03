resource "aws_db_instance" "app_database" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "10.13"

  instance_class          = "db.t2.micro"
  name                    = "app_database"
  username                = var.db_username
  password                = var.db_password
  backup_window           = "17:30-19:30"
  backup_retention_period = 10
  db_subnet_group_name    = aws_db_subnet_group.default.id
  vpc_security_group_ids  = [aws_security_group.allow_all_postgres.id]

  publicly_accessible = true
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}
