#!/bin/bash
#Copy onto new host and execute to create ansible user 
groupadd -g 1201 ansible
useradd -u 1201 -g 1201 -m -d /opt/ansible ansible
echo -e 'ansible\tALL=(ALL)\tNOPASSWD:\tALL' > /etc/sudoers.d/ansible
mkdir /opt/ansible/.ssh
chmod 700 /opt/ansible/.ssh
scp -rp root@192.168.1.144:/opt/ansible/.ssh/authorized_keys /opt/ansible/.ssh/
chown ansible:ansible  -R /opt/ansible
