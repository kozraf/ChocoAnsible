output "cidr_block" {
  value = aws_vpc.CA-VPC1.cidr_block
}

output "vpc" {
  description = "VPC"
  value       = aws_vpc.CA-VPC1
}

output "vpc_id" {
  description = "VPC id"
  value       = aws_vpc.CA-VPC1.id
}

output "subnet_CA-USEAST1A-PUB_id" {
  description = "subnet id"
  value       = aws_subnet.CA-USEAST1A-PUB.id
}

output "subnet_CA-USEAST1B-PRIV_id" {
  description = "subnet id"
  value       = aws_subnet.CA-USEAST1B-PRIV.id
}