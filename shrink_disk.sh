#!/bin/sh

# shrink the disk image
# https://pve.proxmox.com/wiki/Shrink_Qcow2_Disk_Files

VMID=200

DISKFILE=/mnt/nas/data1/vm/images/$VMID/vm-$VMID-disk-0.qcow2
mv $DISKFILE $DISKFILE.orig
qemu-img convert -O qcow2 -c $DISKFILE.orig $DISKFILE
rm $DISKFILE.orig
