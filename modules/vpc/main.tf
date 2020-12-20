provider "aws" {
  shared_credentials_file = "${var.aws_cred_path}"
  region = "${var.aws_region}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_vpc_subnet_az_1}", "${var.aws_vpc_subnet_az_2}"]
  private_subnets = ["10.0.1.0/24","10.0.60.0/24"]
  public_subnets  = ["10.0.10.0/24"]

  public_subnet_tags = {
    Name = "${var.aws_vpc_name}-public"
  }

  private_subnet_tags = {
    Name = "${var.aws_vpc_name}-private"
  }

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  vpc_tags = {
    Name = "${var.aws_vpc_name}"
  }
}
