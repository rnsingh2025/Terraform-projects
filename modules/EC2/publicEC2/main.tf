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
# resource "aws_eip" "public_ip" {
#   for_each = var.public_instances
#   instance = aws_instance.public_ec2[each.key].id
#   vpc      = true
# }

# resource "null_resource" "copy_pem" {
#   depends_on = [aws_instance.public_ec2]
#   triggers = {
#     instance_id = aws_instance.public_ec2["master"].id
#   }

#   connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("${pathexpand("~")}/${var.pem_file_name}.pem")
#       timeout     = "5m"
#       host        = aws_eip.public_ip["master"].public_ip
#     }


#   provisioner "remote-exec" {
#     inline = [
#       "until (-f /var/lib/cloud/instance/boot-finished); do sleep 2; done"
#     ]
#     }
#   provisioner "file" {
#     source      = "${pathexpand("~")}/${var.pem_file_name}.pem"
#     destination = "/home/ubuntu/${var.pem_file_name}.pem"
#     }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod 400 /home/ubuntu/${var.pem_file_name}.pem",
#       "sudo chown ubuntu:ubuntu /home/ubuntu/${var.pem_file_name}.pem"
#     ]
#   }
# }