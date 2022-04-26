output "vpc" {
  value = module.networking
}

output "vpc_id" {
  value = module.networking.vpc_id
}

#output "subnet_id" {
#  value = module.vpc.subnet_CA-USEAST1A-PUB_id
#}