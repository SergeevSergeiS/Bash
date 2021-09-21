#! /bin/bash

#https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04-ru

echo "------UFW configure------"

RESULT=`ufw status | grep Status: |awk '{print $2}'`
if [[ "$RESULT" == "active" ]] ; then
    echo 'UFW is start and configured already.'
else
    ufw --force enable
    ufw allow 2498
    ufw allow http
    ufw default deny incoming
    ufw default allow outgoing
    echo 'UFW is configured.'
fi
echo "------UFW configured------"
