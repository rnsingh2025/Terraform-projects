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


