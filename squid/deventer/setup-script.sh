#!/bin/bash
cd /home/debian
mkdir /home/debian/apache
wget https://raw.githubusercontent.com/sjihtam/Deventer-scripts/main/squid/squid.conf
wget https://raw.githubusercontent.com/sjihtam/Deventer-scripts/main/squid/deventer/wpad.dat
mkdir /home/debian/apache
mv wpad.dat /home/debian/apache
docker pull sameersbn/squid:latest
docker pull httpd
docker run --name squid -d --restart=always --publish 3128:3128 --volume /home/debian/squid.conf:/etc/squid/squid.conf --volume /srv/docker/squid/cache:/var/spool/squid --log-driver syslog sameersbn/squid:latest
docker run -dit --name squid-apache -p 80:80 -v /home/debian/apache/:/usr/local/apache2/htdocs httpd
