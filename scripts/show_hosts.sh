/etc/ansible/hosts --list | jq -r '. | del(._meta)'
