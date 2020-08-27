#!/bin/sh

REPO=proxmox-plex

sudo rm -R ~/$REPO

git clone https://github.com/shepner/$REPO.git ~

chmod -R 754 ~/$REPO/*.sh

mv ~/*.sh ~
