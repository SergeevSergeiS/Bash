#! /bin/bash

#AWS support: https://docs.amazonaws.cn/en_us/AWSEC2/latest/UserGuide/managing-users.html

echo "------Create serviceuser------"
new_user=serviceuser

RESULT=`awk -F: '{ print $1}' /etc/passwd | grep $new_user`
if [[ "$RESULT" == "$new_user" ]] ; then
    echo 'User is already created.'
else
    useradd -m -p $(openssl passwd -1 serviceuser) -s /bin/bash $new_user
    usermod -aG sudo serviceuser
    echo "$new_user ALL=NOPASSWD:/bin/systemctl" >> /etc/sudoers
    echo "$new_user is created."
fi
echo "------End of user creating and configuring------"

echo $'\n'
