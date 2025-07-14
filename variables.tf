variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "k8s-vpc"
}

variable "public_sg_name" {
  description = "The name of the public security group"
  type        = string
  default     = "k8s-public-security-group"

}
variable "private_sg_name" {
  description = "The name of the private security group"
  type        = string
  default     = "k8s-private-security-group"
}
