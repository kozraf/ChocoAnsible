resource "aws_eip" "CA-EIP" {
  vpc              = true
  public_ipv4_pool = "amazon"
}