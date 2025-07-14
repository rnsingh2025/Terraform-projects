variable "public_instances" {
  description = "A map of public EC2 instances to be created"
  type        = map(object({
    ami           = string
    instance_type = string
   
  }))
  default     = {
    master = {
      ami           = "ami-0a7d80731ae1b2435" # Example AMI ID, replace with actual
      instance_type = "t2.medium" # Example instance type, replace with actual
    }
  }
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}
variable "public_security_group_id" {
  description = "The ID of the public security group"
  type        = string
}
variable "pem_file_name" {
  description = "The name of the PEM file to be used for EC2 instances"
  type        = string
}