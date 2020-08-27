#!/bin/sh

sudo service plexmediaserver stop

#sudo rsync -a /var/lib/plexmediaserver /mnt/nas/docker1/plex.backup/
tar -cf /mnt/nas/docker1/plex.backup/plexmediaserver.tar /var/lib/plexmediaserver/


sudo service plexmediaserver start
