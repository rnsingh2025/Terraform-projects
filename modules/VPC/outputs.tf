output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
  
}
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.public_subnet.pub_subnet_id
}