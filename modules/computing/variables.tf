variable "key_name" {
  type = string
}

variable "CA-EC2-BASTION_amiused" {
  type = string
}
variable "CA-EC2-BASTION_sbnetid" {
  type = string
}

variable "CA-EC2-BASTION_secgroup" {
  type = list(string)
}


variable "CA-EC2-BASTION_tag_name" {
  type = string
  }

variable "CA-EC2-orchestrator_amiused" {
  type = string
}
variable "CA-EC2-orchestrator_sbnetid" {
  type = string
}
variable "CA-EC2-orchestrator_secgroup" {
  type = list(string)
}
variable "CA-EC2-orchestrator_tag_name" {
  type = string
  }

variable "CA-EC2-chocorepo_amiused" {
  type = string
}
variable "CA-EC2-chocorepo_sbnetid" {
  type = string
}
variable "CA-EC2-chocorepo_secgroup" {
  type = list(string)
}
variable "CA-EC2-chocorepo_tag_name" {
  type = string
  }

variable "CA-EC2-admin_amiused" {
  type = string
}
variable "CA-EC2-admin_sbnetid" {
  type = string
}
variable "CA-EC2-admin_secgroup" {
  type = list(string)
}
variable "CA-EC2-admin_tag_name" {
  type = string
  }


