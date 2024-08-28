
resource "aws_security_group" "sg-alb1" {
  name        = "alb-sg"
  vpc_id      = aws_vpc.vpc1.id
  description = "Allow  http"

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  depends_on = [aws_vpc.vpc1]
}
