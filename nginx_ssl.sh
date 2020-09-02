#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y

sudo cd /root/
wget https://merope.meta1.io/ssl-nginx.tar.gz | sed 's/\r//g'

tar zxvf ssl-nginx.tar.gz && cp -rfv sites-available/ /etc/nginx/ && cp -rfv ssl/ /etc/nginx/ &
read -p "Unpacking and deploying..." -t 3
echo ""
echo ""
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
clear
echo ""
echo ""
service nginx restart &
read -p "Starting NGINX with WebSocket on 666 and SSL..." -t 2
