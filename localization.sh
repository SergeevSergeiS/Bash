#! /bin/bash

echo "------Set locale------"
#more details here: https://www.tecmint.com/set-system-locales-in-linux/
locale=en_US.UTF-8
lc=C.UTF-8

RESULT=`locale | grep LC_ALL=$lc`
if [[ "$RESULT" == "LC_ALL=$lc" ]] ; then
    echo 'Locale is set already.'
else
    locale-gen $locale
    update-locale LC_ALL=$lc
    update-locale LANGUAGE=$lc
    echo 'Locale is set. User must logout and login or reboot system.'
fi
echo "------Finish setting locale------"

echo $'\n'
