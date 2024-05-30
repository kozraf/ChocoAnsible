resource "aws_eip" "CA-EIP" {
  domain = "vpc"
  public_ipv4_pool = "amazon"
}