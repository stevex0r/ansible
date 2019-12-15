#!/bin/bash
#Copy onto new host and execute to create ansible user 
useradd -m -d /opt/ansible ansible
echo -e 'ansible\tALL=(ALL)\tNOPASSWD:\tALL' > /etc/sudoers.d/ansible
scp -rp root@192.168.1.44:/opt/ansible/.ssh /opt/ansible/
chown ansible:ansible  -R /opt/ansible
