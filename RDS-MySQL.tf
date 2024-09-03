
resource "aws_db_instance" "utc-db" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db-username
  password             = var.db-password
  availability_zone    = aws_subnet.private[5].availability_zone
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  //db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.DB-sg.id]
  depends_on             = [aws_vpc.vpc1, aws_subnet.private[5], aws_security_group.DB-sg]
}

/*
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [
    aws_subnet.private[4].id, # Second to last private subnet
    //aws_subnet.private[-1].id  # Last private subnet
  ]
  description = "RDS subnet group for the last two private subnets"
}
*/