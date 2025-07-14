resource "aws_instance" "public_ec2" {
  for_each      = var.public_instances
  ami           = each.value.ami
  instance_type = each.value.instance_type

  subnet_id              = var.public_subnet_id
  key_name               = var.pem_file_name
  vpc_security_group_ids = [var.public_security_group_id]

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }
    tags = {
        Name = "${each.key}"
    }
}
