# before downloading script, make sure the machine has it's IP setup and the hostname changed.
# ifup <adapter ens192>
# if command can't turn on the connection, change port in vsphere and try above command again.
# sudo dhclient <adapter ens192>
# sudo hostnamectl set-hostname <new hostname> 
# download and run script using following commands:
# wget <raw github link script.sh>
# sudo chmod +x <script.sh>
# ./<script.sh>

# update and docker install
#!/bin/bash
# manually configured IP and set 8.8.8.8 as second DNS-server
sudo dnf update
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf repolist -v
sudo dnf install docker-ce --nobest --allowerasing
sudo systemctl enable --now docker
# If docker has error with containerd then update libseccomp using command below
# sudo dnf update libseccomp 
sudo usermod -aG docker $USER

