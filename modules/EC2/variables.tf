variable "pem_file_name" {
  description = "The name of the PEM file to be used for EC2 instances"
  type        = string
  default     = "k8s-project-key.pem"
}
variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}
variable "public_security_group_id" {
  description = "The ID of the public security group"
  type        = string
}
