provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "networking"{
source =  "./modules/networking"
}

module "CA-EC2-orchestrator_instance" {
  source   = "./modules/computing"
  sbnetid = module.networking.subnet_CA-USEAST1B-PRIV_id
  key_name = aws_key_pair.key_pair.key_name
  secgroup = [module.networking.sg_CA-PRIVATE-SG_id]
  tag_name = "CA-EC2-orchestrator"
}

module "CA-EC2-BASTION_instance" {
  source   = "./modules/computing"
  sbnetid = module.networking.subnet_CA-USEAST1A-PUB_id
  key_name = aws_key_pair.key_pair.key_name
  secgroup = [module.networking.sg_CA-BASTION_id]
  tag_name = "CA-EC2-BASTION"
}