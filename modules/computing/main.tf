data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20211129"]
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
    values = ["Windows_Server-2019-English-Full-Base-2022.04.13"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 owners = ["801119661308"] #microsoft
}



resource "aws_instance" "instances" {
  ami             = var.amiused
  instance_type   = "t2.micro"
  subnet_id = var.sbnetid
  vpc_security_group_ids = var.secgroup
  key_name = var.key_name
  associate_public_ip_address = "${var.sbnetid == "subnet-04e6884b1d6b650bb" ? true : false}"

tags = {
    Name = var.tag_name
  }
}

