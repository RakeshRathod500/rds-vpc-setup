resource "random_string" "pw_suffix" {
  length  = 8
  special = false
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-db-subnets"
  subnet_ids = var.subnet_ids
  tags = { Name = "${var.name_prefix}-db-subnet-group" }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.name_prefix}-rds"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  # name                    = var.db_name
  username                = var.username
  password                = var.password != null ? var.password : random_string.pw_suffix.result
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = true
  apply_immediately       = false
  publicly_accessible     = true
  multi_az                = var.multi_az
  deletion_protection     = false
  backup_retention_period = var.backup_retention
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  tags = { Name = "${var.name_prefix}-rds" }
}
