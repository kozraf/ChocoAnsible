variable "key_name" {
  type = string
}

variable "bastion_amiused" {
  type = string
}
variable "bastion_sbnetid" {
  type = string
}

variable "bastion_secgroup" {
  type = list(string)
}


variable "bastion_tag_name" {
  type = string
  }

variable "orchestrator_amiused" {
  type = string
}
variable "orchestrator_sbnetid" {
  type = string
}
variable "orchestrator_secgroup" {
  type = list(string)
}
variable "orchestrator_tag_name" {
  type = string
  }

variable "chocorepo_amiused" {
  type = string
}
variable "chocorepo_sbnetid" {
  type = string
}
variable "chocorepo_secgroup" {
  type = list(string)
}
variable "chocorepo_tag_name" {
  type = string
  }

variable "admin_amiused" {
  type = string
}
variable "admin_sbnetid" {
  type = string
}
variable "admin_secgroup" {
  type = list(string)
}
variable "admin_tag_name" {
  type = string
  }


