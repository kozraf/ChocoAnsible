/*data "aws_ami" "ubuntu" {
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

resource "aws_instance" "CA-EC2-PRIVATE" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.CA-USEAST1B-PRIV.id
  security_groups = [aws_security_group.PROJECT1-PRIVATE-SG.id]
  #key_name = aws_key_pair.PROJECT1-KP.id

  tags = {
    Name = var.ec2_name1
  }
}

*/