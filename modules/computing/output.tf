output "amiids" {
  value = {
    ubuntuami  = data.aws_ami.ubuntu.id
    windowsami = data.aws_ami.windows.id
  }
}

output "BASTION_public_IP" {
  value = aws_instance.CA-EC2-BASTION.public_ip

}