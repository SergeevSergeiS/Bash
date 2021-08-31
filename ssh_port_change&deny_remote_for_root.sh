#! /bin/bash

echo "------Change ssh port and set root login deny------"
old_ssh=22
new_ssh=2498

RESULT=`netstat -tnulp | grep '$old_ssh' | awk '{print $4}' | cut -d : -f 2`
if [[ "$RESULT" == 22 ]] ; then
    echo 'SSH is configured already.'
else
    sed -i "s/#Port $old_ssh/Port $new_ssh/g" /etc/ssh/sshd_config
    sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
    systemctl restart sshd
    echo 'SSH is configured.'
fi
echo "------Finish setting ssh port and root permissions------"

echo $'\n'
