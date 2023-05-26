#! /bin/bash

# Script to get ip
echo "Select type of IP (public/private)"
read IP

if [[ -z $IP ]]
then
    echo "Insert a valid option"
else
    if [[ $IP == "public" ]]
    then
        PUB_IP=$(wget -qO - https://ipinfo.io/ip)
        echo -e "\nYour public IP is $PUB_IP\n"
    else if [[ $IP == "private" ]]
    then
        PRI_IP=$(ifconfig | grep -E '[0-9]{3}\.[0-9]{3}\.[0-9]{1}\.[0-9]{2}' | awk '{print $2}')
        echo -e "\nYou private IP is $PRI_IP\n"
    else    
        echo -e "\nInvalid Argument\n"
    fi
    fi
fi
