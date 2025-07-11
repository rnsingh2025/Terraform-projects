output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = aws_security_group.publicsg.id
}