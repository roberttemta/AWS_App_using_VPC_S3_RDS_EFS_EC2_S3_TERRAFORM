
# Creating the VPC

resource "aws_vpc" "vpc1" {
  //count = 10
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc-name
    Team = var.Team
    env  = var.ENVIRONMENT
  }
}

