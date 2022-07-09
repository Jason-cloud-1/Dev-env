
resource "aws_security_group" "developer" {
  name        = "allow"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = "TLS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "web" {
  ami                    = local.ami-id
  instance_type          = var.instance_type
  key_name               = var.ssh-key-pair-name
  iam_instance_profile   = "ssm-instances"
  vpc_security_group_ids = [aws_security_group.developer.id]
  root_block_device {
    volume_size = 30
    # (8 unchanged attributes hidden)
  }
 
  tags = {
    Name = "${var.environment-prefix}-bastion"
  }
}

resource "null_resource" "dev-env" {
   provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = var.ssh-private-key
      host        = aws_instance.web.public_ip     
    }
    source = "./configuration.tpl"
    destination = "/tmp/configuration.tpl"
   }
   
}
# resource "null_resource" "dev-configuration" {
#    depends_on = [null_resource.dev-env]
#    provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/configuration.tpl",
#       "/tmp/configuration.tpl"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = var.ssh-private-key
#       host        = aws_instance.web.public_ip
#     }
#   }
# }

