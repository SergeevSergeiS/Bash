#! /bin/bash
#Make sure that apt isn't busy before doing any other installations
while [[ `ps aux | grep -i apt | wc -l` != 1 ]] ; do
    echo 'apt is locked by another process.'
    sleep 15
    ps aux | grep -i apt | wc -l
done

echo 'apt is free. Let`s continue.'

echo $'\n'
