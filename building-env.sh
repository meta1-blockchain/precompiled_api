#!/bin/bash
DIR=/root/

#Preparing Ubuntu 20 Environment

sudo apt-get update 
apt-get install autoconf cmake make automake libtool git \
libboost-all-dev libssl-dev g++ libcurl4-openssl-dev htop \
screen unzip iotop htop -y

#Building swap

sudo mkdir /meta1api/
cd /meta1api/

sudo fallocate -l 10G swap
sudo chmod 600 swap
sudo mkswap swap
if output=$(sudo swapon /meta1api/swap);
        then
                printf 'SWAP success, the output is available at <>\m' "$output"
fi

cd /
clear
ldconfig
sudo sysctl vm.swappiness=30 #Amount of remaining RAM when to switch to SWAP in %
sudo sysctl vm.vfs_cache_pressure=35 #Pressure on balance between RAM and SWAP
sudo echo "vm.swappiness = 30" | sudo tee -a /etc/sysctl.conf #Adding it to the system startup as default value
sudo echo "vm.vfs_cache_pressure = 35" | sudo tee -a /etc/sysctl.conf #Addint it to the system startup as default value
sudo echo "/meta1api/swap none swap sw 0 0" | sudo tee -a /etc/fstab #system boot - swap partition init

#Reboot in 1 minute
sudo shutdown -r +1
