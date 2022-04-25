output "cidr_block" {
  value = aws_vpc.CA-VPC1.cidr_block
}

output "vpc_id" {
  description = "VPC id"
  value       = aws_vpc.CA-VPC1.id
}