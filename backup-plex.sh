#!/bin/sh

sudo service plexmediaserver stop

sudo rsync -a /var/lib/plexmediaserver /mnt/nas/docker1/plex.backup/

sudo service plexmediaserver start
