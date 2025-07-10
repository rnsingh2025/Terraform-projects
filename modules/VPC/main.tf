resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}
module "public_subnet" {
  source = "./publicsubnet"
  vpc_id = aws_vpc.vpc.id
  public_subnet_cidr = var.public_subnet_block
  public_subnet_az = var.public_subnet_az1
  
}