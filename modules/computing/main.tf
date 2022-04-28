data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "CA-EC2-orch" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id = var.sbnetid
  vpc_security_group_ids = var.secgroup
  key_name = var.key_name

tags = {
    Name = var.tag_name
  }
}

/*resource "aws_instance" "CA-EC2-PUBLIC" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id = 
  key_name = var.key_name

tags = {
    Name = var.CA-EC2-public_name
  }
}
*/
