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
  subnet_id = module.networking.subnet_CA-USEAST1B-PRIV_id
  key_name = aws_key_pair.key_pair.key_name

}
