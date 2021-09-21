#! /bin/bash

echo "------Install Monit------"
package=monit

if  systemctl is-active --quiet $package ; then
    echo "Monit already installed and running."
else
    apt update
    apt upgrade -y
    apt install $package -y
    cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.back
    unlink /etc/nginx/sites-enabled/default
    echo \
        'server {
            listen 80;
            server_name 127.0.0.1;
            location / {
                proxy_pass http://127.0.0.1:2812;
                proxy_set_header Host $host;
            }
        }' > /etc/nginx/sites-available/monit
    ln -s /etc/nginx/sites-available/monit /etc/nginx/sites-enabled/monit
    nginx -s reload
    sed -i 's/# set httpd/set httpd/i; s/#     use address/use address/i; s/#     allow localhost/allow localhost/i; s/#     allow admin:monit/allow devops:test/i' /etc/monit/monitrc
    echo \
        'check process nginx with pidfile /var/run/nginx.pid
            start program = "/etc/init.d/nginx start"
            stop program = "/etc/init.d/nginx stop"' >> /etc/monit/monitrc
    monit reload
    systemctl enable $package
    echo "$package is installed."
fi
echo "------Installed Monit------"

echo $'\n'
