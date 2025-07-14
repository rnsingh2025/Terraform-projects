resource "aws_instance" "private_ec2" {
  for_each      = var.private_instances
  ami           = each.value.ami
  instance_type = each.value.instance_type

  subnet_id              = var.private_subnet_id
  key_name               = var.pem_file_name
  vpc_security_group_ids = [var.private_security_group_id]

  root_block_device {
    volume_size           = 25
    volume_type           = "gp3"
    delete_on_termination = true
  }
    tags = {
        Name = "${each.key}"
    }
}
