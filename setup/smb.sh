#!/bin/sh

# CIFS support ([article](https://wiki.ubuntu.com/MountWindowsSharesPermanently))
# Use this for anything that has SMB enabled to avoid permission issues in certain situations

sudo apt update
sudo apt install -y cifs-utils

sh -c 'cat > ~/.smbcredentials << EOF
username=
password=
domain=
EOF'
chmod 600 ~/.smbcredentials
echo "Run 'vi ~/.smbcredentials' and edit the user ID/password"

sudo mkdir -p /mnt/nas/data1/media
echo "//nas/media /mnt/nas/data1/media cifs rw,uid=`id -un`,gid=asyla,credentials=/home/`id -un`/.smbcredentials 0 0" | sudo tee --append /etc/fstab
