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

output "sg_CA-PUBLIC-SG_id" {
  description = "security group id"
  value       = aws_security_group.CA-PUBLIC-SG
}

output "sg_CA-BASTION_id" {
  description = "security group id"
  value       = aws_security_group.CA-BASTION-SG.id
}

output "sg_CA-PRIVATE-SG_id" {
  description = "security group id"
  value       = aws_security_group.CA-PRIVATE-SG.id
}

output "CA-NATGW_id" {
  description = "CA-NATGW_id"
  value       = aws_nat_gateway.CA-NATGW.id
}
