#!/bin/bash -eux

# Install ansible
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update -y
apt-get install -y ansible

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers