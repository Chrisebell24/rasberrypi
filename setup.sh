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
# yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2 && yes | curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && yes | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && yes | sudo apt install docker-ce && sudo systemctl status docker
# yes | sudo apt-get install docker.io
curl -sSL https://get.docker.com | sh
