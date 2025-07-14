module "pemfile" {
  source = "./pemfile"
  pem_file_name = var.pem_file_name

}
module "publicEC2" {
  source                   = "./publicEC2"
  pem_file_name            = var.pem_file_name
  public_subnet_id = var.public_subnet_id
  public_security_group_id = var.public_security_group_id
 
}

module "privateEC2" {
  source                   = "./privateEC2"
  pem_file_name            = var.pem_file_name
  private_subnet_id = var.private_subnet_id
  private_security_group_id = var.private_security_group_id

}
