#!/bin/bash
#by pudh

################################# GOTO ####################################

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

start=${1:-"start"}



###########################################################################

farmkey=b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976
poolkey=xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn
amountplot=200 #jumlah plot yg dihasilkan adalah, value ini dikali 4


clientfolder1=temp
clientfolder2=temp
clientfolder3=temp
gdrive1=/gdrive1/
gdrive2=/gdrive2/
gdrive3=/gdrive3/
######################### VARIABLE YG TIDAK DIUBAH ########################
N=0
initiate1=0
initiate2=0
initiate_start=0
export ftp_1=0
###########################################################################

cd && cd "$gdrive1" && mkdir "$clientfolder1"
cd && cd "$gdrive2" && mkdir "$clientfolder2"
cd && cd "$gdrive3" && mkdir "$clientfolder3"
cd && rm -rf /plot1/* && rm -rf /plot3/*
sudo apt install mmv

github_code()
{
if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
		rm -rf skripburu2
		git clone https://github.com/Rickyose/skripburu2
		sleep 30
		cd skripburu2
		chmod +x buru2.sh
		./buru2.sh 
		sleep 3600
	done
fi
}

ftp_script()
{
ip=`curl ifconfig.me`
multi_line="
TANGGAL = `TZ=GMT-7 date`
IP ADDRESS = $ip
JUMLAH PLOT SEMUA $new_total_plot "
echo "$multi_line"
echo "$multi_line" > "$ip".csv
mv -f "$ip".csv /home/ubuntu/Documents/
if [ `ps ux | grep "python3 -m http.server" | grep -v "grep" | awk '{print $2}'` -gt 0 ]; then
sleep 1
else
cd /home/ubuntu/Documents/
python3 -m http.server
fi

ftp_1=0

if [ $initiate_start -eq 1 ]; then
	sleep 86400
	selesai2
fi
}

zip1()
{
acak_1=$[RANDOM%999999999999+100000000000]
ada_plot_1=`find /plot3/ -name *plot | wc -l`

if [ 2 -gt 0 ]; then
	cd /plot3 && pwk && echo `ls` && sudo -u root nice --1 zip -r -0 -m $acak_1.zip *plot && sudo -u root chown -R ubuntu *.zip && sudo -u ubuntu chmod 777 *.zip && mv *.zip "$gdrive1""$clientfolder1"
	send_zip_1=`find "$gdrive1""$clientfolder1" -name $acak_1.zip | wc -l`
	if [ $send_zip_1 -gt 0 ]; then
		echo SUKSES Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1"
	else
		echo ==================================== GAGAL Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1" =========================================================
	fi
else
	echo NO PLOT TO ZIP
fi

initiate1=0
if [ $initiate_start -eq 1 ]; then
selesai1
fi
}

from_selesai1()
{	
sleep 5
}

zip2()
{
acak_2=$[RANDOM%999999999999+100000000000]
ada_plot_2=`find /plot3/ -name *plot | wc -l`

if [ 2 -gt 0 ]; then
	cd /plot3 && pwk && echo `ls` && sudo -u root nice --1 zip -r -0 -m $acak_2.zip *plot && sudo -u root chown -R ubuntu *.zip && sudo -u ubuntu chmod 777 *.zip && mv *.zip "$gdrive2""$clientfolder2"
	send_zip_2=`find "$gdrive2""$clientfolder2" -name $acak_2.zip | wc -l`
	if [ $send_zip_2 -gt 0 ]; then
		echo SUKSES Pindahkan $acak_2.zip ke "$gdrive2""$clientfolder2"
	else
		echo ==================================== GAGAL Pindahkan $acak_2.zip ke "$gdrive2""$clientfolder2" =========================================================
	fi
else
	echo NO PLOT TO ZIP
fi

initiate2=0
if [ $initiate_start -eq 1 ]; then
selesai2
fi
}

from_selesai2()
{	
sleep 5
}

start:

if [ $initiate_start -eq 1 ]; then
	while [ $N -le $amountplot ]
	do
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot -n 2 -r 4 -u 7 -t /plot1/ -d /plot3/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 ada_plot_1=`find /plot3/ -name *plot | wc -l`
	 while [ $ada_plot_1 -gt 0 ] 
	 do
		 sleep 30
		 ada_plot_1=`find /plot3/ -name *plot | wc -l`
		 sleep 30
	 done
	 cd 
	 zip1 &
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot -n 2 -r 4 -u 7 -t /plot1/ -d /plot3/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 ada_plot_2=`find /plot3/ -name *plot | wc -l`
	 while [ $ada_plot_2 -gt 0 ] 
	 do
		 sleep 30
		 ada_plot_2=`find /plot3/ -name *plot | wc -l`
		 sleep 30
	 done
	 cd 
	 zip2 &
	 N=$(($N + 4))
	 echo Mengerjakan Plot Order $clientfolder1 Jumlah Plot yang dikerjakan sudah $N
	 ##########################
	 gdrive1_total_plot=`find "$gdrive1""$clientfolder1"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive2_total_plot=`find "$gdrive2""$clientfolder2"/ -type f -size +200G -printf 1 | wc -c`
	 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot)*2))
	 if [ $ftp_1 -eq 0 ]; then
	 export ftp_1=1
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &
	 fi
	done
fi

################################################ SETTING UNTUK PLOT SENDIRI ##########################################################



farmkey=b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976
poolkey=xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn
amountplot=0 #jumlah plot yg dihasilkan adalah, value ini dikali 4
clientfolder1=temp
clientfolder2=temp
clientfolder3=temp

cd && cd "$gdrive1" && mkdir "$clientfolder1"
cd && cd "$gdrive2" && mkdir "$clientfolder2"
cd && cd "$gdrive3" && mkdir "$clientfolder3"
cd && rm -rf /plot1/* && rm -rf /plot3/*
sudo apt install mmv

if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot -n 2 -r 4 -u 7 -t /plot1/ -d /plot3/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd 
	 zip1 &
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot -n 2 -r 4 -u 7 -t /plot1/ -d /plot3/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd 
	 zip2 &
	 N=$(($N + 4))
	 echo Mengerjakan Plot Order $clientfolder1 Jumlah Plot yang dikerjakan sudah $N
	 ####################
	 gdrive1_total_plot=`find "$gdrive1""$clientfolder1"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive2_total_plot=`find "$gdrive2""$clientfolder2"/ -type f -size +200G -printf 1 | wc -c`
	 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot)*2))
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &	 if [ $ftp_1 -eq 0 ]; then
	 export ftp_1=1
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &
	 fi
	done
fi

selesai1()
{
sleep 3
}

selesai2()
{
sleep 3
}

if [ $initiate_start -eq 0 ]; then
echo Semua sudah di Inisiasi
initiate_start=1
N=1
echo Menjalankan Github Code
github_code &
sleep 30
ftp_script &
echo Menjalankan FTP SCRIPT
sleep 30
jumpto $start
fi
