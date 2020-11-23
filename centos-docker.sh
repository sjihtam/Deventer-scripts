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

