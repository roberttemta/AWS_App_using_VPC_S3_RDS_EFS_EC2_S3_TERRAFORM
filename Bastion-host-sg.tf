

# Creating the security group

resource "aws_security_group" "bastion-sg" {
  name        = "bastion-host-sg"
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow ssh"

  ingress {
    description = "allow http"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.2.1.236/32"]
    //security_groups = [aws_security_group.sg-alb1.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    env  = var.ENVIRONMENT
    Team = var.Team
  }
  depends_on = [aws_vpc.vpc1, aws_security_group.sg-alb1]
}



