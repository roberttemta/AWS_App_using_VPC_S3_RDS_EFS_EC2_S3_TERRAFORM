
resource "aws_instance" "bastion-server" {
  ami                    = var.ami-bastion
  instance_type          = var.INSTANCE_TYPE
  key_name               = aws_key_pair.aws_key.key_name
  //user_data              = file("server-install.sh")
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  subnet_id              = aws_subnet.private[5].id

  tags = {
    Name = var.bastion-host-server-name
    Team = var.Team
    env  = var.ENVIRONMENT
  }

  depends_on = [aws_key_pair.aws_key, aws_vpc.vpc1]

}
/*
resource "null_resource" "n1" {

  connection {
    type        = "ssh"
    port        = 22
    user        = "ec2-user"
    host        = aws_instance.bastion-server.public_ip
    private_key = file(local_file.ssh_key.filename)
  }



  provisioner "file" {
    destination = "/ec2-user/${var.filename}"
    source      = "./${var.filename}"

  }



  provisioner "remote-exec" {
    inline = [
      "chmod 400 /ec2-user/${var.filename}"
    ]
  }

  depends_on = [aws_instance.bastion-server]

}
*/