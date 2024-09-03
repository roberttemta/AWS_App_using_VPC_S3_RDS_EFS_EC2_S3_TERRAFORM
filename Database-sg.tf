

# Creating the security group

resource "aws_security_group" "DB-sg" {
  name        = var.db-sg-name
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow MySQL"

  ingress {
    description = "allow MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg-inst.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.db-sg-name
    env  = var.ENVIRONMENT
    Team = var.Team
  }
  depends_on = [aws_vpc.vpc1, aws_security_group.sg-inst]
}
