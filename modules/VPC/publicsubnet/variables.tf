variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string

}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "public_subnet_az" {
  description = "The availability zone for the public subnet"
  type        = string
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "k8s-vpc"
}