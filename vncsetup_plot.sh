#!/bin/bash
#by pudh


############################### Install Vncserver dan alat2 plotting
cd && cd /root/
sudo apt-get update -y
sudo apt-get install gnome-shell -y && sudo apt-get install ubuntu-gnome-desktop -y && sudo apt-get install autocutsel -y && sudo apt-get install gnome-core -y && sudo apt-get install gnome-panel -y && sudo apt-get install gnome-themes-standard -y && sudo apt install -y iotop libsodium-dev libgmp3-dev cmake g++ git -y
sudo apt install -y libsodium-dev cmake g++ git build-essential
git clone https://github.com/madMAx43v3r/chia-plotter.git && cd chia-plotter
git submodule update --init && ./make_devel.sh && ./build/chia_plot --help
cd /root/
sudo apt-get install tightvncserver -y
############################### Add VNC PASSWORD, AGAR TIDAK SURUH MASUKIN PASS WAKTU INSTALL VNCSERVER
myuser="root"
mypasswd="Aa666666"

mkdir /$myuser/.vnc
echo $mypasswd | vncpasswd -f > /$myuser/.vnc/passwd
chown -R $myuser:$myuser /$myuser/.vnc
chmod 0600 /$myuser/.vnc/passwd
##############################################
mv -f /root/plot_server/plot_start.sh /root/
mv -f /root/plot_server/vnc_plot_server.txt /root/
chown -R root plot_start.sh && chmod +x plot_start.sh
chown -R root vnc_plot_server.txt && chmod +x vnc_plot_server.txt

wget https://raw.githubusercontent.com/Rickyose/plot_direct_server/main/vnc_plot_server.txt
chown -R ubuntu vnc_plot_server.txt && chmod +x vnc_plot_server.txt

pwd
sleep 5
#vncserver
#echo sleep 10
#sleep 10
#vncserver -kill :1 && sleep 5
cp vnc_plot_server.txt /root/.vnc/xstartup
sleep 5
vncserver
sleep 10
vncserver -kill :1
sleep 5
vncserver
sleep 10
pwd
############################### Install rclone dan import config
cd /root/
sudo apt-get install fuse3 -y
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && unzip rclone-current-linux-amd64.zip && cd rclone-*-linux-amd64 && sudo cp rclone /usr/bin/ && sudo chown root:root /usr/bin/rclone && sudo chmod 755 /usr/bin/rclone && sudo mkdir -p /usr/local/share/man/man1 && sudo cp rclone.1 /usr/local/share/man/man1/ && sudo mandb
sleep 10
echo menunggu RCLONE SIAP
ada_rclone=`rclone config file`
echo " RCLONE CONFIG ADA DI $ada_rclone"
sleep 10
mkdir /root/.config/rclone
sleep 5
cd /root/.config/rclone
wget  https://raw.githubusercontent.com/Rickyose/plot_direct_server/main/rclone.conf
chown -R root rclone.conf
chmod +x rclone.conf
chown -R root /root/.config/rclone/
pwd

###################################### Chmod dan Chown
cd /root/plot_server
chown -R root vncsetup_plot.sh && chmod +x vncsetup_plot.sh
chown -R root dest_dir_list.txt  && chmod +x dest_dir_list.txt 
chown -R root source_dir_list.txt  && chmod +x source_dir_list.txt 
chown -R root mount.sh  && chmod +x mount.sh
chown -R root rclone.conf && chmod +x rclone.conf

#######################################################################
cd /root/
############################# write out current crontab #############################
sudo -u root crontab -l > mycron
#echo new cron into cron file
sudo -u root echo "@reboot sudo -u root vncserver & bash /root/plot_server/disk.sh & sleep 120 && bash /root/plot_server/mount.sh && bash /root/plot_start.sh" >> mycron
#install new cron file
sudo -u root crontab mycron
sudo -u root rm -rf mycron 
#####################################################################################
#bash plot_start.sh &
echo sudah selesai
