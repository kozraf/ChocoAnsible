resource "aws_vpc" "CA-VPC1" {
  cidr_block = var.cidr_block
    tags = {
    Name = "CA-VPC1"
  }
}