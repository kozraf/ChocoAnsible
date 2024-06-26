data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240411"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-2024.04.10"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 owners = ["801119661308"] #microsoft
}



resource "aws_instance" "CA-EC2-BASTION" {
  ami                         = var.CA-EC2-BASTION_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-BASTION_sbnetid
  vpc_security_group_ids      = var.CA-EC2-BASTION_secgroup
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile        = var.iam_instance_profile

tags = {
    Name = var.CA-EC2-BASTION_tag_name
  }
}

resource "aws_instance" "CA-EC2-orchestrator" {
  ami                         = var.CA-EC2-BASTION_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-orchestrator_sbnetid
  vpc_security_group_ids      = var.CA-EC2-orchestrator_secgroup
  key_name                    = var.key_name
  user_data                   = "${file("CA-EC2-orchestrator_user_data.sh")}"
  iam_instance_profile        = var.iam_instance_profile
tags = {
    Name = var.CA-EC2-orchestrator_tag_name
  }
}

resource "aws_instance" "CA-EC2-chocorepo" {
  ami = var.CA-EC2-chocorepo_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-chocorepo_sbnetid
  vpc_security_group_ids      = var.CA-EC2-chocorepo_secgroup
  key_name                    = var.key_name
  #user_data = "${file("CA-EC2-orchestrator_user_data.sh")}"
tags = {
    Name = var.CA-EC2-chocorepo_tag_name
  }
}