resource "aws_security_group" "admin-sg" {
  name        = var.admin-sg_name
  description = var.admin-sg_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.admin-sg_name
  }
}

resource "aws_security_group" "bastion-sg" {
  name        = var.bastion-sg_name
  description = var.bastion-sg_name
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
    Name = var.bastion-sg_name
  }
}

resource "aws_security_group" "orchestrator-sg" {
  name        = var.orchestrator-sg_name
  description = var.orchestrator-sg_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.bastion-sg.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.orchestrator-sg_name
  }
}


resource "aws_security_group" "chocorepo-sg" {
  name        = var.chocorepo-sg_name
  description = var.chocorepo-sg_name
  vpc_id      = aws_vpc.CA-VPC1.id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    security_groups  = ["${aws_security_group.admin-sg.id}"]
  }


/*
  ingress {
    description = "WinRM-HTTP"
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    security_groups  = ["${aws_security_group.orchestrator-sg.id}"]
  }
*/
  ingress {
    description = "WinRM-HTTPS"
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    security_groups  = ["${aws_security_group.orchestrator-sg.id}"]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.chocorepo-sg_name
  }
}