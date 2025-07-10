terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "k8s-project-bucket-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    
  }
}
provider "aws" {
  region = "us-east-1"
}

module "S3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}