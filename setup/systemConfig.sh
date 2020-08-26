#!/bin/sh

# simple script for updating the scripts from github
cat > ~/update-scripts.sh << EOF
cd ~/proxmox-plex
git pull
EOF
chmod 754 ~/update-scripts.sh

# Patch the system
cat > ~/update.sh << EOF
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt -y autoremove
EOF
chmod 754 ~/update.sh
~/update.sh


# Set the timezone
sudo timedatectl set-timezone America/Chicago

# QEMU agent
# https://pve.proxmox.com/wiki/Qemu-guest-agent
sudo apt-get update
sudo apt-get install -y qemu-guest-agent
sudo systemctl start qemu-guest-agent

# Install net-tools
sudo apt-get update
sudo apt-get install -y net-tools


#  Disk monitoring
sudo apt update
sudo apt install -y smartmontools

#systemctl status smartd
