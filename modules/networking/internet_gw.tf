resource "aws_internet_gateway" "CA-IGW" {
  vpc_id = aws_vpc.CA-VPC1.id

  tags = {
    Name = var.igw_CA-IGW_name
  }
}