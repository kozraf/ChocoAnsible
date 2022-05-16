#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo apt update -y
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
sudo apt install python3-pip
sudo pip install pywinrm[credssp]

export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
export ANSIBLE_STDOUT_CALLBACK=yaml