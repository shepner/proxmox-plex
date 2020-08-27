# proxmox-plex

run the following

``` shell
bash <(curl -s https://raw.githubusercontent.com/shepner/proxmox-plex/master/setup/create_vm.sh)
```

install Ubuntu 20.04 the usual way.

provide a static IP address

install OpenSSH

## Fix the UID

First set the permissions of the home dir:

``` shell
sudo chown -R 1001 /home/`id -un`
```

Then change the UID accodingly in the passwd files:

``` shell
sudo vipw
```

Finally, logout and back in again

## Setup ssh keys

Do this from the local workstation:

``` shell
DHOST=plex
ssh-copy-id -i ~/.ssh/shepner_rsa.pub $DHOST

scp ~/.ssh/shepner_rsa $DHOST:.ssh/shepner_rsa
scp ~/.ssh/shepner_rsa.pub $DHOST:.ssh/shepner_rsa.pub
scp ~/.ssh/config $DHOST:.ssh/config
ssh $DHOST "chmod -R 700 ~/.ssh"
```

## Configure the system

``` shell
bash <(curl -s https://raw.githubusercontent.com/shepner/proxmox-plex/master/update-scripts.sh)

~/proxmox-plex/setup/userConfig.sh
~/proxmox-plex/setup/systemConfig.sh
~/proxmox-plex/setup/smb.sh
~/proxmox-plex/setup/plex.sh
```

