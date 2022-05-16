/*
hashicorp/local v2.2.2
hashicorp/aws v4.10.0
hashicorp/tls v3.3.0
*/

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

  bastion_amiused = module.computing.amiids.ubuntuami
  bastion_sbnetid = module.networking.subnet_CA-USEAST1A-PUB_id
  bastion_secgroup = [module.networking.bastion-sg_id]
  bastion_tag_name = "bastion"

  orchestrator_amiused = module.computing.amiids.ubuntuami
  orchestrator_sbnetid = module.networking.subnet_CA-USEAST1B-PRIV_id
  orchestrator_secgroup = [module.networking.orchestrator-sg_id]
  orchestrator_tag_name = "orchestrator"

  chocorepo_amiused = module.computing.amiids.windowsami
  chocorepo_sbnetid = module.networking.subnet_CA-USEAST1B-PRIV_id
  chocorepo_secgroup = [module.networking.chocorepo-sg_id]
  chocorepo_tag_name = "chocorepo"

  admin_amiused = module.computing.amiids.windowsami
  admin_sbnetid = module.networking.subnet_CA-USEAST1A-PUB_id
  admin_secgroup = [module.networking.admin-sg_id]
  admin_tag_name = "admin"

  depends_on = [module.networking.CA-NATGW_id]
}

module "ansible"{
source =  "./modules/ansible"
}