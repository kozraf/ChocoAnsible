resource "aws_nat_gateway" "CA-NATGW" {
  subnet_id     = aws_subnet.CA-USEAST1A-PUB.id
  allocation_id = aws_eip.CA-EIP.id
  tags          = {
    Name = var.ngw_CA-NATGW_name
  }
  depends_on = [aws_internet_gateway.CA-IGW]
}