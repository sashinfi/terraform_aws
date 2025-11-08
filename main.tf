terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "${var.aws_region}"
  
}


module "ec2_instance" {
  source  ="terraform-aws-modules/ec2-instance/aws"
  name = "sathish-ec2-instance"
  ami = "${var.aws_ec2_ami}"
  instance_type = "${var.aws_ec2_instance_type}"
  key_name      = "${var.aws_keypair}"
  monitoring    = true
  subnet_id     = "${var.aws_ec2_subnet}"

  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
