resource "aws_subnet" "CA-USEAST1A-PUB" {
  vpc_id     = aws_vpc.CA-VPC1.id
  cidr_block = var.subnet_CA-USEAST1A-PUB_CIDR
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_CA-USEAST1A-PUB_name
  }
}

resource "aws_subnet" "CA-USEAST1B-PRIV" {
  vpc_id     = aws_vpc.CA-VPC1.id
  cidr_block = var.subnet_CA-USEAST1B-PRIV_CIDR

  tags = {
    Name = var.subnet_CA-USEAST1B-PRIV_name
  }
}