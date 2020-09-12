#!/bin/bash

# Wifi Settings
sudo -s
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
chmod 644 /etc/resolv.conf
exit

# General
yes | sudo apt-get update

# Install SSH & Firewall Settings
yes | sudo apt-get install openssh-server && sudo systemctl enable ssh && sudo systemctl start ssh && sudo ufw allow 22 && sudo ufw allow 4000 && sudo ufw allow 8888

# Install No Machine
yes | sudo apt-get install alien && yes | wget https://download.nomachine.com/download/6.11/Raspberry/nomachine_6.11.2_1_armhf.deb && yes | sudo dpkg -i nomachine_6.11.2_1_armhf.deb

# Install Docker
curl -sSL https://get.docker.com | sh
docker run --device=/dev/vchiq --device=/dev/vcsm --volume=/opt/vc:/opt/vc --volume=/boot:/boot --volume=/sys:/dockerhost/sys:ro --volume=/etc:/dockerhost/etc:ro --volume=/proc:/dockerhost/proc:ro --volume=/usr/lib:/dockerhost/usr/lib:ro -p=8888:8888 --name="rpi-monitor" -d  michaelmiklis/rpi-monitor:latest
