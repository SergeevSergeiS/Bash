#! /bin/bash

echo "------Set time------"
#Maybe you want to do this first: https://www.linuxjournal.com/content/add-your-city-linuxs-list-time-zones
region=Europe
city=Moscow

RESULT=`timedatectl | grep " Time zone" | awk '{print $3}'`
if  [[ "$RESULT" == "$region/$city" ]]; then
    echo 'Time zone is already correct.'
else
    unlink /etc/localtime
    ln -s /usr/share/zoneinfo/$region/$city /etc/localtime
    echo 'Time was zone corrected.'
fi
echo "------Finish setting time------"

echo $'\n'
