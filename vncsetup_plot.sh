#!/bin/bash
#by pudh


############################### Install Vncserver dan alat2 plotting
cd /home/ubuntu/
sudo apt-get update -y && sudo apt-get upgrade -y && 
sudo apt-get install gnome-shell -y && sudo apt-get install ubuntu-gnome-desktop -y && sudo apt-get install autocutsel -y && sudo apt-get install gnome-core -y && sudo apt-get install gnome-panel -y && sudo apt-get install gnome-themes-standard -y && sudo apt install -y iotop libsodium-dev libgmp3-dev cmake g++ git -y && 
git clone https://github.com/madMAx43v3r/chia-plotter.git && cd chia-plotter && git submodule update --init && ./make_devel.sh && ./build/chia_plot --help
cd /home/ubuntu/
sudo apt-get install tightvncserver -y
############################### Add VNC PASSWORD, AGAR TIDAK SURUH MASUKIN PASS WAKTU INSTALL VNCSERVER
myuser="ubuntu"
mypasswd="Aa666666"

mkdir /home/$myuser/.vnc
echo $mypasswd | vncpasswd -f > /home/$myuser/.vnc/passwd
chown -R $myuser:$myuser /home/$myuser/.vnc
chmod 0600 /home/$myuser/.vnc/passwd
##############################################
mv -f /home/ubuntu/plot_server/plot_start.sh /home/ubuntu/
mv -f /home/ubuntu/plot_server/vnc_plot_server.txt /home/ubuntu/
chown -R ubuntu plot_start.sh && chmod +x plot_start.sh
chown -R ubuntu vnc_plot_server.txt && chmod +x vnc_plot_server.txt
pwd
sleep 5
vncserver
echo sleep 10
sleep 10
vncserver -kill :1 && sleep 5
cp vnc_plot_server.txt /home/ubuntu/.vnc/xstartup
sleep 5
vncserver
sleep 10
pwd
############################### Install rclone dan import config
cd /home/ubuntu/
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && unzip rclone-current-linux-amd64.zip && cd rclone-*-linux-amd64 && sudo cp rclone /usr/bin/ && sudo chown root:root /usr/bin/rclone && sudo chmod 755 /usr/bin/rclone && sudo mkdir -p /usr/local/share/man/man1 && sudo cp rclone.1 /usr/local/share/man/man1/ && sudo mandb
sleep 10
echo menunggu RCLONE SIAP
ada_rclone=`rclone config file`
echo " RCLONE CONFIG ADA DI $ada_rclone"
sleep 10
cd /home/ubuntu/.config/rclone
wget  https://github.com/Rickyose/plot_server/raw/main/rclone.conf
chown -R ubuntu rclone.conf
chmod +x rclone.conf
chown -R ubuntu /home/ubuntu/.config/rclone/
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
cd /home/ubuntu/plot_server
chown -R ubuntu vncsetup_plot.sh && chmod +x vncsetup_plot.sh
chown -R ubuntu dest_dir_list.txt  && chmod +x dest_dir_list.txt 
chown -R ubuntu source_dir_list.txt  && chmod +x source_dir_list.txt 
chown -R ubuntu rclone.conf && chmod +x rclone.conf

############################### Mount Gdrive
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive1: /gdrive1 && chmod 777 gdrive1 && chown -R ubuntu /gdrive1 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive2: /gdrive2 && chmod 777 gdrive2 && chown -R ubuntu /gdrive2 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive3: /gdrive3 && chmod 777 gdrive3 && chown -R ubuntu /gdrive3 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive4: /gdrive4 && chmod 777 gdrive4 && chown -R ubuntu /gdrive4 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive5: /gdrive5 && chmod 777 gdrive5 && chown -R ubuntu /gdrive5 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive6: /gdrive6 && chmod 777 gdrive6 && chown -R ubuntu /gdrive6 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive7: /gdrive7 && chmod 777 gdrive7 && chown -R ubuntu /gdrive7 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive8: /gdrive8 && chmod 777 gdrive8 && chown -R ubuntu /gdrive8 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive9: /gdrive9 && chmod 777 gdrive9 && chown -R ubuntu /gdrive9 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive10: /gdrive10 && chmod 777 gdrive10 && chown -R ubuntu /gdrive10 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive11: /gdrive11 && chmod 777 gdrive11 && chown -R ubuntu /gdrive11 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive12: /gdrive12 && chmod 777 gdrive12 && chown -R ubuntu /gdrive12 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive13: /gdrive13 && chmod 777 gdrive13 && chown -R ubuntu /gdrive13 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive14: /gdrive14 && chmod 777 gdrive14 && chown -R ubuntu /gdrive14 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive15: /gdrive15 && chmod 777 gdrive15 && chown -R ubuntu /gdrive15 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive16: /gdrive16 && chmod 777 gdrive16 && chown -R ubuntu /gdrive16 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive17: /gdrive17 && chmod 777 gdrive17 && chown -R ubuntu /gdrive17 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive18: /gdrive18 && chmod 777 gdrive18 && chown -R ubuntu /gdrive18 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive19: /gdrive19 && chmod 777 gdrive19 && chown -R ubuntu /gdrive19 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive20: /gdrive20 && chmod 777 gdrive20 && chown -R ubuntu /gdrive20 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive31: /gdrive31 && chmod 777 gdrive31 && chown -R ubuntu /gdrive31 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive32: /gdrive32 && chmod 777 gdrive32 && chown -R ubuntu /gdrive32 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive33: /gdrive33 && chmod 777 gdrive33 && chown -R ubuntu /gdrive33 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive34: /gdrive34 && chmod 777 gdrive34 && chown -R ubuntu /gdrive34 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive35: /gdrive35 && chmod 777 gdrive35 && chown -R ubuntu /gdrive35 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive36: /gdrive36 && chmod 777 gdrive36 && chown -R ubuntu /gdrive36 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive37: /gdrive37 && chmod 777 gdrive37 && chown -R ubuntu /gdrive37 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive38: /gdrive38 && chmod 777 gdrive38 && chown -R ubuntu /gdrive38 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive39: /gdrive39 && chmod 777 gdrive39 && chown -R ubuntu /gdrive39 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive40: /gdrive40 && chmod 777 gdrive40 && chown -R ubuntu /gdrive40 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive41: /gdrive41 && chmod 777 gdrive41 && chown -R ubuntu /gdrive41 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive42: /gdrive42 && chmod 777 gdrive42 && chown -R ubuntu /gdrive42 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive43: /gdrive43 && chmod 777 gdrive43 && chown -R ubuntu /gdrive43 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive44: /gdrive44 && chmod 777 gdrive44 && chown -R ubuntu /gdrive44 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive45: /gdrive45 && chmod 777 gdrive45 && chown -R ubuntu /gdrive45 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive46: /gdrive46 && chmod 777 gdrive46 && chown -R ubuntu /gdrive46 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive47: /gdrive47 && chmod 777 gdrive47 && chown -R ubuntu /gdrive47 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive48: /gdrive48 && chmod 777 gdrive48 && chown -R ubuntu /gdrive48 & sleep 5 
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive49: /gdrive49 && chmod 777 gdrive49 && chown -R ubuntu /gdrive49 & sleep 5
sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive50: /gdrive50 && chmod 777 gdrive50 && chown -R ubuntu /gdrive50 & sleep 5
#######################################################################
cd /home/ubuntu/
bash plot_start.sh &
echo sudah selesai
