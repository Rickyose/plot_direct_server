#!/bin/bash
#by pudh


############################### Install Vncserver dan alat2 plotting
cd && cd /root/
sudo apt-get update -y
sudo apt-get install gnome-shell -y && sudo apt-get install root-gnome-desktop -y && sudo apt-get install autocutsel -y && sudo apt-get install gnome-core -y && sudo apt-get install gnome-panel -y && sudo apt-get install gnome-themes-standard -y && sudo apt install -y iotop libsodium-dev libgmp3-dev cmake g++ git -y
git clone https://github.com/madMAx43v3r/chia-plotter.git && cd chia-plotter && git submodule update --init && ./make_devel.sh && ./build/chia_plot --help
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
vncserver -kill :1 && sleep 5
pwd
############################### Install rclone dan import config
cd /root/
sudo apt-get install fuse3
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

############################### Mkdir untuk gdrive zip source dan destination
cd /
cd gdrive1 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive2 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive3 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive4 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive5 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive6 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive7 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive8 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive9 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive10 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive11 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive12 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive13 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive14 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive15 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive16 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive17 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive18 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive19 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive20 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive31 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive32 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive33 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive34 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive35 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive36 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive37 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive38 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive39 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive40 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive41 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive42 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive43 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive44 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive45 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive46 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive47 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive48 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive49 && mkdir cha && mkdir temp
cd &&  cd /
cd gdrive50 && mkdir cha && mkdir temp
cd &&  cd /
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
sudo -u root echo "@reboot sudo -u root vncserver && bash /root/plot_start.sh" >> mycron
#install new cron file
sudo -u root crontab mycron
sudo -u root rm -rf mycron 
#####################################################################################
#bash plot_start.sh &
echo sudah selesai
