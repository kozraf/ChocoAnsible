variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
  }


variable "subnet_CA-USEAST1A-PUB_name" {
  type = string
  default = "CA-USEAST1A-PUB"
}

variable "subnet_CA-USEAST1A-PUB_CIDR" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_CA-USEAST1B-PRIV_name" {
  type = string
  default = "CA-USEAST1B-PRIV"
}

variable "subnet_CA-USEAST1B-PRIV_CIDR" {
  type = string
  default = "10.0.2.0/24"
}

variable "igw_CA-IGW_name" {
  type = string
  default = "CA-IGW"
}

variable "ngw_CA-NATGW_name" {
  type = string
  default = "CA-NATGW"
}

variable "rt_CA-PUB-RT_name" {
  type = string
  default = "CA-PUB-RT"
}

variable "rt_CA-PRIV-RT_name" {
  type = string
  default = "CA-PRIV-RT"
}

variable "orchestrator-sg_name" {
  type = string
  default = "orchestrator-sg"
}

variable "bastion-sg_name" {
  type = string
  default = "bastion-sg"
}

variable "chocorepo-sg_name" {
  type = string
  default = "chocorepo-sg"
}

variable "admin-sg_name" {
  type = string
  default = "admin-sg"
}