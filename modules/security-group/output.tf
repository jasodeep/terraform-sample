output "aws_sg_id" {
  description = "The ID of the security group"
  value = module.rds_mysql_sg.this_security_group_id
}