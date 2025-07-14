terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "k8s-project-bucket-s3"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }
}
provider "aws" {
  region = "us-east-1"
}

# module "S3" {
#   source      = "./modules/s3"
#   bucket_name = var.bucket_name
# }

module "VPC" {
  source   = "./modules/VPC"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}
module "public_security_group" {
  source          = "./modules/SecurityGroup"
  vpc_id          = module.VPC.vpc_id
  public_sg_name  = var.public_sg_name
  private_sg_name = var.private_sg_name
}
module "EC2" {
  source = "./modules/EC2"
  public_subnet_id         = module.VPC.public_subnet_id
  public_security_group_id = module.public_security_group.public_security_group_id
  private_subnet_id        = module.VPC.private_subnet_id
  private_security_group_id = module.public_security_group.private_security_group_id
}