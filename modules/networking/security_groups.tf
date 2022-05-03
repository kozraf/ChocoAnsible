resource "aws_security_group" "CA-PUBLIC-SG" {
  name        = var.sg_CA-PUBLIC-SG_name
  description = var.sg_CA-PUBLIC-SG_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_CA-PUBLIC-SG_name
  }
}

resource "aws_security_group" "CA-BASTION-SG" {
  name        = var.sg_CA-BASTION-SG_name
  description = var.sg_CA-BASTION-SG_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_CA-BASTION-SG_name
  }
}

resource "aws_security_group" "CA-PRIVATE-SG" {
  name        = var.sg_CA-PRIVATE-SG_name
  description = var.sg_CA-PRIVATE-SG_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.CA-BASTION-SG.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_CA-PRIVATE-SG_name
  }
}