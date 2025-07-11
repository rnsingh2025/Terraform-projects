variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string

}

variable "private_subnet_az" {
  description = "The availability zone for the private subnet"
  type        = string

}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
    default     = "k8s-vpc"
    }
variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}