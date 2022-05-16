output "amiids" {
  value = {
    ubuntuami  = data.aws_ami.ubuntu.id
    windowsami = data.aws_ami.windows.id
  }
}

output "BASTION_public_IP" {
  value = aws_instance.bastion.public_ip

}

output "ADMIN_public_IP" {
  value = aws_instance.admin.public_ip
}