
# Creating the security group

resource "aws_security_group" "sg-inst" {
  name        = var.server-sg-name
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow ssh and httpd"

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg-alb1.id]
  }

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.server-sg-name
    env  = var.ENVIRONMENT
    Team = var.Team
  }
  depends_on = [aws_vpc.vpc1, aws_security_group.sg-alb1, aws_security_group.bastion-sg]
}



