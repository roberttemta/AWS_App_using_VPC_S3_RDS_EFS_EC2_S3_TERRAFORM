
# Public subnet 1 
resource "aws_subnet" "public" {
  count                   = length(var.subnet_cidr_public)
  availability_zone       = var.az[count.index]
  cidr_block              = var.subnet_cidr_public[count.index]
  vpc_id                  = aws_vpc.vpc1.id
  map_public_ip_on_launch = true

  tags = {
    Name = "utc-vpc-public-subnet-${var.az[count.index]}"
  }
}


# Private-subnet 1a
resource "aws_subnet" "private" {
  count             = length(var.subnet_cidr_private)
  availability_zone = element(var.az, count.index % length(var.az))
  cidr_block        = var.subnet_cidr_private[count.index]
  vpc_id            = aws_vpc.vpc1.id

  tags = {
    Name = "utc-vpc-private-subnet-${element(var.az, count.index % length(var.az))}"
  }
}
