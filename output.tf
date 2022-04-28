/*output "vpc" {
  value = module.networking
}
*/

output "vpc_id" {
  value = module.networking.vpc_id
}

output "sg" {
  value = {
    bastion = module.networking.sg_CA-BASTION_id
    private = module.networking.sg_CA-PRIVATE-SG_id
    public  = module.networking.sg_CA-PUBLIC-SG_id
  }

}

#output "subnet_id" {
#  value = module.vpc.subnet_CA-USEAST1A-PUB_id
#}