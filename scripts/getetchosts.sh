#/etc/ansible/hosts --list | grep -B 1 ansible_host


true > /homenfs/smohr/.openstack.menu

sed -n '/###OpenStackHosts###/q;p'  /etc/hosts > /etc/hosts.new

echo "###OpenStackHosts###" >> /etc/hosts.new

for OSIP in $(/etc/ansible/hosts --list | grep ansible_host | grep -o '".*"' | sed 's/"//g'  | sed 's/ansible_host: //'); do
    echo "$OSIP"

    OSHOST=$(/etc/ansible/hosts --list |  grep -B 1 ansible_host | grep -B 1 $OSIP  | head -n 1 | grep -o '".*"' | sed 's/"//g')
    echo "$OSHOST"
echo "$OSIP   $OSHOST"  >> /etc/hosts.new

echo "prog "$OSHOST" null gnome-terminal -x ssh smohr@$OSIP" >> /homenfs/smohr/.openstack.menu

done

cp /etc/hosts /etc/hosts.bak
cp /etc/hosts.new /etc/hosts
