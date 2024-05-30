provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "networking"{
source =  "./modules/networking"
}

module "computing" {
  source   = "./modules/computing"

  key_name = aws_key_pair.key_pair.key_name
  iam_instance_profile = aws_iam_instance_profile.IAMprofile_instance_profile.name

  CA-EC2-BASTION_amiused = module.computing.amiids.ubuntuami
  CA-EC2-BASTION_sbnetid = module.networking.subnet_CA-USEAST1A-PUB_id
  CA-EC2-BASTION_secgroup = [module.networking.sg_CA-BASTION_id]
  CA-EC2-BASTION_tag_name = "CA-EC2-BASTION"

  CA-EC2-orchestrator_amiused = module.computing.amiids.ubuntuami
  CA-EC2-orchestrator_sbnetid = module.networking.subnet_CA-USEAST1B-PRIV_id
  CA-EC2-orchestrator_secgroup = [module.networking.sg_CA-PRIVATE-SG_id]
  CA-EC2-orchestrator_tag_name = "CA-EC2-orchestrator"


  CA-EC2-chocorepo_amiused = module.computing.amiids.windowsami
  CA-EC2-chocorepo_sbnetid = module.networking.subnet_CA-USEAST1B-PRIV_id
  CA-EC2-chocorepo_secgroup = [module.networking.sg_CA-PRIVATE-SG_id]
  CA-EC2-chocorepo_tag_name = "CA-EC2-chocorepo"

  depends_on = [module.networking.CA-NATGW_id]
}
