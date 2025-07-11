output "pub_subnet_id" {
    description = "The public subnet ID"
    value       = aws_subnet.public_subnet.id
}