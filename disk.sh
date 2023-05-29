#!/bin/bash
#by pudh

############################## Mount SSD Drives
cd /
mkdir plot1
sudo mdadm --create --verbose /dev/md1 --level=0 --raid-devices=2 /dev/nvme0n1 /dev/nvme0n2
sudo mkfs.btrfs -n 65536 -f /dev/md1 # create a filesystem on the array
sudo mount /dev/md1 /plot1 -t btrfs -o rw,nobarrier,noatime,nofail
echo '/dev/md1 /plot1 btrfs rw,nobarrier,noatime,nofail 0 0' >> /etc/fstab

mkdir /plot1/zip_plot
sudo -u root chown -R root /plot1 && sudo -u root chmod 777 plot1
sudo -u root chown -R root /plot1/zip_plot && sudo -u root chmod 777 /plot1/zip_plot
######################################################################################################
