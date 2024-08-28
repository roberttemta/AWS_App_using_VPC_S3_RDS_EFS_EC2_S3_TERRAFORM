
#creating the instance 1
resource "aws_instance" "server" {
  count                       = 2
  ami                         = var.ami-app-servers
  instance_type               = var.INSTANCE_TYPE
  key_name                    = aws_key_pair.aws_key.key_name
  user_data                   = file("server-install.sh")
  vpc_security_group_ids      = [aws_security_group.sg-inst.id]
  subnet_id                   = element([aws_subnet.public[0].id, aws_subnet.public[1].id], count.index)
  //subnet_id                   = element([aws_subnet.private[0], aws_subnet.private[1].id], count.index)
  associate_public_ip_address = true
  //availability_zone      = "us-east-1a"
# This is the configuration that works for me. But when I try to put both server in Private subnets, 
# the target group shows server unhealthy.
  tags = {
    Name = "utc-app-server-${count.index + 1}"
    
  }
  /*
   tags = merge(
    { "Name" = var.server.name },
  ${count.index}
  )
*/
depends_on = [aws_vpc.vpc1, aws_security_group.sg-inst]
}

/*
#creating the instance 1

resource "aws_instance" "server2" {
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  //key_name      = aws_key_pair.aws_key.key_name
  user_data              = file("server-install.sh")
  vpc_security_group_ids = [aws_security_group.sg-inst.id]
  subnet_id              = aws_subnet.public2.id
  associate_public_ip_address = true
  availability_zone      = "us-east-1b"

  tags = {
    Name = "alb-vpc-instance2"
  }
}
*/