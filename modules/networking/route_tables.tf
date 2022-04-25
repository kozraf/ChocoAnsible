resource "aws_route_table" "CA-PUB-RT" {
  vpc_id = aws_vpc.CA-VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.CA-IGW.id
  }

  tags = {
    Name = var.rt_CA-PUB-RT_name
  }
}

resource "aws_route_table" "CA-PRIV-RT" {
  vpc_id = aws_vpc.CA-VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.CA-NATGW.id
  }

  tags = {
    Name = var.rt_CA-PRIV-RT_name
  }
}

resource "aws_route_table_association" "CA-USEAST1A-PUBtoCA-PUB-RT" {
  subnet_id      = aws_subnet.CA-USEAST1A-PUB.id
  route_table_id = aws_route_table.CA-PUB-RT.id
}

resource "aws_route_table_association" "CA-USEAST1B-PRIVtoCA-PRIV-RT" {
  subnet_id      = aws_subnet.CA-USEAST1B-PRIV.id
  route_table_id = aws_route_table.CA-PRIV-RT.id
}