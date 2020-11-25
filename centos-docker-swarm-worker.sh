#!/bin/bash

# before downloading script, make sure the machine has it's IP setup and the hostname changed.
# ifup <adapter ens192>
# if command can't turn on the connection, change port in vsphere and try above command again.
# sudo dhclient <adapter ens192>
# sudo hostnamectl set-hostname <new hostname> 
# download and run script using following commands:
# wget <raw github link script.sh>
# sudo chmod +x <script.sh>
# ./<script.sh>

# update packlages and install docker
sudo dnf update
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf repolist -v
sudo dnf install docker-ce --nobest --allowerasing
sudo systemctl enable --now docker
# If docker has error with containerd then update libseccomp using command below
# sudo dnf update libseccomp 
sudo usermod -aG docker $USER
# swarm worker firewall rules and join swarm
sudo firewall-cmd --add-port=2376/tcp --permanent
sudo firewall-cmd --add-port=7946/tcp --permanent
sudo firewall-cmd --add-port=7946/udp --permanent
sudo firewall-cmd --add-port=4789/udp --permanent
sudo firewall-cmd --reload
sudo systemctl restart docker
sudo docker swarm join --token SWMTKN-1-5ixcv7cs02tqxozia527f3v77trignhiqxkbt7nzibdv7rwg44-9qv4o3z2mu8m2ovlwockvpj7t 10.16.1.7:2377
