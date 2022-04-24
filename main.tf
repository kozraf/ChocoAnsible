provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc"{
source =  "./modules/networking"
}
output "outputs" {
  value = module.vpc.vpc_id
}