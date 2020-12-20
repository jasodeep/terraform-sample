provider "aws" {
  shared_credentials_file = "${var.aws_cred_path}"
  region = "${var.aws_region}"
}

module "aws_vpc" {
  source = "./modules/vpc"
  
  aws_region = "${var.aws_region}"
  aws_cred_path = "${var.aws_cred_path}"
  aws_vpc_name = "${var.aws_vpc_name}"
  aws_vpc_subnet_az_1 = "${var.aws_vpc_subnet_az_1}"
  aws_vpc_subnet_az_2 = "${var.aws_vpc_subnet_az_2}"
}

module "security_group" {
  source = "./modules/security-group"

  aws_region = "${var.aws_region}"
  aws_cred_path = "${var.aws_cred_path}"
  aws_vpc_id = "${module.aws_vpc.vpc_id}"
  aws_vpc_cidr_block = "${module.aws_vpc.vpc_cidr_block}"
}

module "rds_mysql" {
  source = "./modules/rds"

  aws_rds_user = "${var.aws_rds_user}"
  aws_rds_pass = "${var.aws_rds_pass}"
  aws_rds_sg = "${module.security_group.aws_sg_id}"
  aws_rds_subnet_ids = "${module.aws_vpc.private_subnets}"
}





