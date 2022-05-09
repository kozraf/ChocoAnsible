resource "aws_instance" "CA-EC2-BASTION" {
  ami = var.CA-EC2-BASTION_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-BASTION_sbnetid
  vpc_security_group_ids      = var.CA-EC2-BASTION_secgroup
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data = "${file("CA-EC2-BASTION_user_data.sh")}"
  depends_on = [local_file.ansible_hosts_file]

  provisioner "file" {
    source = "${path.root}/modules/ansible/hosts"
    destination = "/home/ubuntu/hosts"

    connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    host     =  self.public_ip
    private_key = file("${path.root}/key.pem")
  }

  }

  tags = {
    Name = var.CA-EC2-BASTION_tag_name
  }
}


resource "aws_instance" "CA-EC2-orchestrator" {
  ami = var.CA-EC2-BASTION_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-orchestrator_sbnetid
  vpc_security_group_ids      = var.CA-EC2-orchestrator_secgroup
  key_name                    = var.key_name
  user_data = "${file("CA-EC2-orchestrator_user_data.sh")}"


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
  user_data = "${file("CA-EC2-chocorepo_user_data.sh")}"
tags = {
    Name = var.CA-EC2-chocorepo_tag_name
  }
}

resource "aws_instance" "CA-EC2-admin" {
  ami = var.CA-EC2-admin_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.CA-EC2-admin_sbnetid
  vpc_security_group_ids      = var.CA-EC2-admin_secgroup
  key_name                    = var.key_name
  #user_data = "${file("CA-EC2-orchestrator_user_data.sh")}"
tags = {
    Name = var.CA-EC2-admin_tag_name
  }
}

resource "local_file" "ansible_hosts_file" {
  content = templatefile("${path.root}/modules/ansible/templates/hosts.tpl",
    {
      ADMIN = aws_instance.CA-EC2-admin.private_ip
      chocorepo = aws_instance.CA-EC2-chocorepo.private_ip
      orchestrator = aws_instance.CA-EC2-orchestrator.private_ip
    }
  )

  filename = "${path.root}/modules/ansible/hosts"

}

