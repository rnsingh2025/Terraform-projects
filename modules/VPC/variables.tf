variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "public_subnet_az1" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_block" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}
variable "private_subnet_az1" {
  description = "The availability zone for the private subnet"
  type        = string
  default     = "us-east-1a"
}