module "rds_mysql" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "rds-mysql"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.large"
  allocated_storage = 100

  name     = "rds_mysql"
  username = "${var.aws_rds_user}"
  password = "${var.aws_rds_pass}"
  port     = "3306"
  storage_type = "io1"
  iops = 1000
  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["${var.aws_rds_sg}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  subnet_ids = "${var.aws_rds_subnet_ids}"

  family = "mysql5.7"

  major_engine_version = "5.7"

  final_snapshot_identifier = "rds-mysql"

  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}