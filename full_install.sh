#!/bin/bash

chmod a+x *.sh
./building-env.sh

echo ""
read -p "Step 1/3 - Building environment is done." -t 3
clear
echo ""
./nginx_ssl.sh
echo ""
read -p "Step 2/3 - NGINX, WebSocket and SSL Installation is done." -t 3
echo ""
clear
./api_deploy.sh 
echo ""
read -p "Step 3/3/ - Meta1API is up and running." -t 5
clear
echo "Process successfully done." 
