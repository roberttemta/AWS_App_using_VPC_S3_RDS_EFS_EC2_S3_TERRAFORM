
# Creating the VPC

resource "aws_vpc" "vpc1" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "utc-vpc"
    Team = var.Team
    env  = var.ENVIRONMENT
  }
}

