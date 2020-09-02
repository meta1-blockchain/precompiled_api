#!/bin/bash
cd /meta1api/
download=$(wget http://explorer.meta1.io/meta1api-precompiled.tar.gz | sed 's/\r//g')
time1=$(date)

#Download and extraction of precompiled latest backup from Explorer API

$download
tar zxvf /meta1api/meta1api-precompiled.tar.gz
echo ""
echo ""
read -p "Wait 5 secs until unpacking is being finalized." -t 5
clear
read -p "Extraction completed. Please wait meta1api is starting..." -t 5

#Start and verification of process meta1api running

cd /meta1api/meta1/witness_node/
meta1api=$(screen -dmS meta1api "./witness_node")

if $meta1api; then
        clear
        tput cup 5 5
        echo "$time1"
        tput cup 6 5
        echo "meta1api is running at http://$(hostname):666"
        tput cup 7 5
        echo "$(screen -list)"
        sleep 10
echo ""
read -p "Post-installation cleanup starting in 2 secs." -t 2
echo ""
read -p "$(rm -rf /meta1api/*.tar.gz)" -t 3
echo ""
echo "To reattach to the screen, type screen -r."
fi
