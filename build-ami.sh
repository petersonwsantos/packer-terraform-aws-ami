#!/bin/bash
# create new ssh key
if [ ! -f "/code/my_ssh_key" ]
then
ssh-keygen -f my_ssh_key -N ''
chmod -R 400  my_ssh_key*
fi
packer build -machine-readable packer-ubuntu.json | tee build.log
AMI_ID=`egrep -m1 -oe 'ami-.{8}' build.log`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
terraform apply
