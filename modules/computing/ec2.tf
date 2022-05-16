resource "aws_instance" "bastion" {
  ami = var.bastion_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.bastion_sbnetid
  vpc_security_group_ids      = var.bastion_secgroup
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data = "${file("bastion_user_data.sh")}"
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
    Name = var.bastion_tag_name
  }
}


resource "aws_instance" "orchestrator" {
  ami = var.bastion_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.orchestrator_sbnetid
  vpc_security_group_ids      = var.orchestrator_secgroup
  key_name                    = var.key_name
  user_data = "${file("orchestrator_user_data.sh")}"


tags = {
    Name = var.orchestrator_tag_name
  }
}

resource "aws_instance" "chocorepo" {
  ami = var.chocorepo_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.chocorepo_sbnetid
  vpc_security_group_ids      = var.chocorepo_secgroup
  key_name                    = var.key_name
  user_data = "${file("chocorepo_user_data.sh")}"
tags = {
    Name = var.chocorepo_tag_name
  }
}

resource "aws_instance" "admin" {
  ami = var.admin_amiused
  instance_type               = "t2.micro"
  subnet_id                   = var.admin_sbnetid
  vpc_security_group_ids      = var.admin_secgroup
  key_name                    = var.key_name
  #user_data = "${file("orchestrator_user_data.sh")}"
tags = {
    Name = var.admin_tag_name
  }
}

resource "local_file" "ansible_hosts_file" {
  content = templatefile("${path.root}/modules/ansible/templates/hosts.tpl",
    {
      admin = aws_instance.admin.private_ip
      chocorepo = aws_instance.chocorepo.private_ip
      orchestrator = aws_instance.orchestrator.private_ip
    }
  )

  filename = "${path.root}/modules/ansible/hosts"

}

