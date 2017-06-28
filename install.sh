#!/bin/bash
sudo apt-get update && sudo apt-get upgrade
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.0.list
echo "deb http://repo.pritunl.com/stable/apt trusty main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A
sudo apt-get update
sudo iptables -A INPUT -p udp -m udp --sport 9700 --dport 1025:65355 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --sport 9700 --dport 1025:65355 -j ACCEPT
sudo apt-get install python-software-properties pritunl mongodb-org -y
sudo service pritunl start
sudo apt-get install squid3
cd /etc/squid3
wget https://pastebin.com/raw/a8vZRERB -O squid.conf
sudo service squid3 restart
