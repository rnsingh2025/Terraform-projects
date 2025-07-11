output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.VPC.vpc_id
  
}
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.VPC.public_subnet_id
}