output "amiids" {
  value = {
    ubuntuami  = data.aws_ami.ubuntu.id
    windowsami = data.aws_ami.windows.id
  }
}