provider "aws" {
  shared_credentials_file = "${var.aws_cred_path}"
  region = "${var.aws_region}"
}

module "rds_mysql_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.17.0"

  name        = "mysql-sg"
  description = "Security group with HTTP and MySQL ports open within current VPC"
  vpc_id      = "${var.aws_vpc_id}"

  ingress_rules = ["mysql-tcp"]
  ingress_cidr_blocks      = ["${var.aws_vpc_cidr_block}"]
}