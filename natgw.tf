# creating the elastic IP in AWS 

resource "aws_eip" "el1" {
  count = 2

}

# Associating the Elastic IP with NAT gateway

resource "aws_nat_gateway" "natgw1" {
  count         = 2
  allocation_id = aws_eip.el1[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
}