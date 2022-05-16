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

output "admin-sg_id" {
  description = "security group id"
  value       = aws_security_group.admin-sg.id
}

output "bastion-sg_id" {
  description = "security group id"
  value       = aws_security_group.bastion-sg.id
}

output "orchestrator-sg_id" {
  description = "security group id"
  value       = aws_security_group.orchestrator-sg.id
}

output "chocorepo-sg_id" {
  description = "security group id"
  value       = aws_security_group.chocorepo-sg.id
}

output "CA-NATGW_id" {
  description = "CA-NATGW_id"
  value       = aws_nat_gateway.CA-NATGW.id
}
