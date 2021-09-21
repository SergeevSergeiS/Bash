#! /bin/bash

echo "------Install NGINX------"
package=nginx

if  systemctl is-active --quiet $package ; then
    echo 'NGINX already installed and running.'
else
    apt update
    apt upgrade -y
    apt install $package -y
    systemctl start $package
    systemctl enable $package;
    echo "$package is installed."
fi
echo "------Installed NGINX------"

echo $'\n'
