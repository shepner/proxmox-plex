#!/bin/sh

sudo ln -s /mnt/nas/data1/media /data

# [Enable repository updating for supported Linux server distributions](https://support.plex.tv/articles/235974187-enable-repository-updating-for-supported-linux-server-distributions/)
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt-get update

# [Installation](https://support.plex.tv/articles/200288586-installation/)
URL="https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu"
sudo curl $URL -L -o /tmp/plexmediaserver.deb
sudo dpkg -i /tmp/plexmediaserver.deb
rm /tmp/plexmediaserver.deb

# http://<IP address>:32400/web


cp ~/proxmox-plex/setup/update-plex.sh ~
chmod 774 ~/update-plex.sh
~/update-plex.sh

