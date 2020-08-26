#!/bin/sh
# [Cloud-Init Support](https://pve.proxmox.com/wiki/Cloud-Init_Support)

# fetch the image
#wget -O /tmp/focal-server-cloudimg-amd64.img https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

# Create the VM Proxmox
# [10.12. Managing Virtual Machines with qm](https://pve.proxmox.com/pve-docs/pve-admin-guide.html#_managing_virtual_machines_with_span_class_monospaced_qm_span)

VMID=200
qm create $VMID \
  --name plex \
  --sockets 1 \
  --cores 6 \
  --memory 16384 \
  --ostype l26 \
  --ide2 nas-data1-iso:iso/ubuntu-20.04.1-live-server-amd64.iso,media=cdrom \
  --scsi0 nas-data1-vm:$VMID,format=qcow2,discard=on,size=256G,ssd=1 \
  --scsihw virtio-scsi-pci \
  --bootdisk scsi0 \
  --net0 virtio,bridge=vmbr0,firewall=1 \
  --onboot 1 \
  --numa 0

# remove the image
#rm /tmp/focal-server-cloudimg-amd64.img

# shrink the disk image (SLOW)
# https://pve.proxmox.com/wiki/Shrink_Qcow2_Disk_Files

DISKFILE=/mnt/nas/data1/vm/images/$VMID/vm-$VMID-disk-0.qcow2
mv $DISKFILE $DISKFILE.orig
qemu-img convert -O qcow2 -c $DISKFILE.orig $DISKFILE
rm $DISKFILE.orig

qm start $VMID
