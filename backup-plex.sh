#!/bin/sh

sudo service plexmediaserver stop

#sudo rsync -a /var/lib/plexmediaserver /mnt/nas/docker1/plex.backup/
sudo sudo tar -cvf /mnt/nas/docker1/plex.backup/plexmediaserver.tar -C /var/lib/ plexmediaserver

# To restore:
#sudo tar -xf /mnt/nas/data1/docker/plex.backup/plexmediaserver.tar -C /var/lib/

sudo service plexmediaserver start
