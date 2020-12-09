#!/bin/bash

#Install required packages
apt install update
apt install nfs-common -y

#Create the destination directory
mkdir -p /mnt/dockershare

#Mount the share
sudo mount -t nfs 10.16.1.6:/mnt/Docker /mnt/dockershare/

#Add the mount to /etc/fstab for automatic mounting
printf "10.16.1.6:/mnt/Docker /mnt/dockershare nfs defaults 0 0" >> /etc/fstab
