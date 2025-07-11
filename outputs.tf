output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.VPC.vpc_id
  
}
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.VPC.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.VPC.private_subnet_id
}
output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = module.public_security_group.public_security_group_id
  
}
output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = module.public_security_group.private_security_group_id
}