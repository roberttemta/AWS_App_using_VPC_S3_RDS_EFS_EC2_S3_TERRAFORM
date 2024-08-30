

# Public route table 1
resource "aws_route_table" "Public-Rt" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }
}
# Private route table 1
resource "aws_route_table" "Private-Rt" {
  count  = 2
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw1[count.index].id
  }
}

# Route and subnet association

resource "aws_route_table_association" "rta" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.Public-Rt.id
}


resource "aws_route_table_association" "rta2" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.Private-Rt[count.index % 2].id
  // I have a difficulty aasociate each of the 2 Private route table to
}

