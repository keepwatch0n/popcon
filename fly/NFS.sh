#!/bin/bash

echo "NFS File Server"

sudo apt update && sudo apt install nfs-kernel-server -y
sudo mkdir -p /srv/nfs/shared
/srv/nfs/shared 192.168.1.0/24(rw,sync,no_subtree_check)
sudo exportfs -a
sudo systemctl restart nfs-kernel-server

echo "Reciver"

sudo apt install nfs-common
echo "mount"
sudo mount <server-ip>:/srv/nfs/shared/mnt
