variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  
}
variable "public_sg_name" {
  description = "The name of the public security group"
  type        = string
}
variable "private_sg_name" {
  description = "The name of the private security group"
  type        = string
}