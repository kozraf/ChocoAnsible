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
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

     egress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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

  tags = {
    Name = var.sg_CA-PRIVATE-SG_name
  }
}