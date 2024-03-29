#!/bin/bash
#by pudh
############################### Menjawab pertanyaan: how-to-disable-login-use-ssh-key (https://serverfault.com/questions/1036627/how-to-disable-login-use-ssh-key & https://stackoverflow.com/questions/41092541/how-to-log-in-to-ssh-without-public-key-only-with-username-and-password)
wget https://raw.githubusercontent.com/Rickyose/plot_direct_server/main/sshd_config && rm -rf /etc/ssh/sshd_config && mv sshd_config /etc/ssh
sudo service ssh restart
############################### Menjawab pertanyaan: How to supply sudo with password from script? (https://stackoverflow.com/questions/24892382/how-to-supply-sudo-with-password-from-script)
echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
###################################### Add user root dan menghilangkan password root
adduser --disabled-password --gecos "" root
echo 'ubuntu:Duri8490' | sudo chpasswd
############################## Install Server
sudo apt-get update -y
apt-get install -y unzip
apt-get install zip -y
apt-get install -y ifstat
###################################### Chmod dan Chown
chown -R root vncsetup_plot.sh && chmod +x vncsetup_plot.sh
chown -R root vnc_plot_server.txt && chmod +x vnc_plot_server.txt
chown -R root dest_dir_list.txt  && chmod +x dest_dir_list.txt 
chown -R root source_dir_list.txt  && chmod +x source_dir_list.txt 
chown -R root plot_start.sh && chmod +x plot_start.sh
chown -R root rclone.conf && chmod +x rclone.conf
chown -R root mount.sh  && chmod +x mount.sh
cp -r /root/plot_server/ /root/
chown -R root /root/plot_server
chown -R root /var/
####################################################################################################
cd /
mkdir gdrive1
mkdir gdrive2
mkdir gdrive3
mkdir gdrive4
mkdir gdrive5
mkdir gdrive6
mkdir gdrive7
mkdir gdrive8
mkdir gdrive9
mkdir gdrive10
mkdir gdrive11
mkdir gdrive12
mkdir gdrive13
mkdir gdrive14
mkdir gdrive15
mkdir gdrive16
mkdir gdrive17
mkdir gdrive18
mkdir gdrive19
mkdir gdrive20
mkdir gdrive21
mkdir gdrive22
mkdir gdrive23
mkdir gdrive24
mkdir gdrive25
mkdir gdrive26
mkdir gdrive27
mkdir gdrive28
mkdir gdrive29
mkdir gdrive30
mkdir gdrive31
mkdir gdrive32
mkdir gdrive33
mkdir gdrive34
mkdir gdrive35
mkdir gdrive36
mkdir gdrive37
mkdir gdrive38
mkdir gdrive39
mkdir gdrive40
mkdir gdrive41
mkdir gdrive42
mkdir gdrive43
mkdir gdrive44
mkdir gdrive45
mkdir gdrive46
mkdir gdrive47
mkdir gdrive48
mkdir gdrive49
mkdir gdrive50
sudo -u root chown -R root /gdrive1
sudo -u root chown -R root /gdrive2
sudo -u root chown -R root /gdrive3
sudo -u root chown -R root /gdrive4
sudo -u root chown -R root /gdrive5
sudo -u root chown -R root /gdrive6
sudo -u root chown -R root /gdrive7
sudo -u root chown -R root /gdrive8
sudo -u root chown -R root /gdrive9
sudo -u root chown -R root /gdrive10
sudo -u root chown -R root /gdrive11
sudo -u root chown -R root /gdrive12
sudo -u root chown -R root /gdrive13
sudo -u root chown -R root /gdrive14
sudo -u root chown -R root /gdrive15
sudo -u root chown -R root /gdrive16
sudo -u root chown -R root /gdrive17
sudo -u root chown -R root /gdrive18
sudo -u root chown -R root /gdrive19
sudo -u root chown -R root /gdrive20
sudo -u root chown -R root /gdrive21
sudo -u root chown -R root /gdrive22
sudo -u root chown -R root /gdrive23
sudo -u root chown -R root /gdrive24
sudo -u root chown -R root /gdrive25
sudo -u root chown -R root /gdrive26
sudo -u root chown -R root /gdrive27
sudo -u root chown -R root /gdrive28
sudo -u root chown -R root /gdrive29
sudo -u root chown -R root /gdrive30
sudo -u root chown -R root /gdrive31
sudo -u root chown -R root /gdrive32
sudo -u root chown -R root /gdrive33
sudo -u root chown -R root /gdrive34
sudo -u root chown -R root /gdrive35
sudo -u root chown -R root /gdrive36
sudo -u root chown -R root /gdrive37
sudo -u root chown -R root /gdrive38
sudo -u root chown -R root /gdrive39
sudo -u root chown -R root /gdrive40
sudo -u root chown -R root /gdrive41
sudo -u root chown -R root /gdrive42
sudo -u root chown -R root /gdrive43
sudo -u root chown -R root /gdrive44
sudo -u root chown -R root /gdrive45
sudo -u root chown -R root /gdrive46
sudo -u root chown -R root /gdrive47
sudo -u root chown -R root /gdrive48
sudo -u root chown -R root /gdrive49
sudo -u root chown -R root /gdrive50

############################### Mount SSD Drives
cd /
mkdir plot1
sudo mdadm --create --verbose /dev/md1 --level=0 --raid-devices=2 /dev/nvme0n1 /dev/nvme0n2
sudo mkfs.btrfs -n 65536 -f /dev/md1 # create a filesystem on the array
sudo mount /dev/md1 /plot1 -t btrfs -o rw,nobarrier,noatime,nofail
echo '/dev/md1 /plot1 btrfs rw,nobarrier,noatime,nofail 0 0' >> /etc/fstab

mkdir /plot1/zip_plot
sudo -u root chown -R root /plot1 && sudo -u root chmod 777 plot1
sudo -u root chown -R root /plot1/zip_plot && sudo -u root chmod 777 /plot1/zip_plot
# wget https://raw.githubusercontent.com/Rickyose/plot_direct_server/main/vncserver.service && mv -f vncserver.service /etc/systemd/system/ && chown -R root /etc/systemd/system/vncserver.service && systemctl enable vncserver && chown -R root /etc/systemd/system/vncserver.service

######################################################################################################
cd /root/plot_server/
bash ./vncsetup_plot.sh &
