resource "aws_vpc" "VPC1" {
  cidr_block = var.cidr_block
    tags = {
    Name = "VPC1"
  }
}