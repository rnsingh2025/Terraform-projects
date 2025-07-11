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
module "private_subnet" {
  source = "./privatesubnet"
  vpc_id = aws_vpc.vpc.id
  private_subnet_cidr = var.private_subnet_block
  private_subnet_az = var.private_subnet_az1
  public_subnet_id = module.public_subnet.pub_subnet_id
  vpc_name = var.vpc_name
}
