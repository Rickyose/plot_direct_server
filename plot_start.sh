#!/bin/bash
#by pudh


###########################################################################

farmkey=b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976
poolkey=xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn


######################### VARIABLE YG TIDAK DIUBAH ########################
N=0
initiate1=0
initiate2=0
initiate_start=0
export ftp_1=0
export mount_gdrive3=`df -h | grep gdrive3 | wc -l`

###########################################################################
sudo mkdir /plot1 && sudo chown -R ubuntu /plot1
sudo mkdir /plot1/zip_plot && sudo chown -R ubuntu /plot1/zip_plot
cd 
find /plot1/ -maxdepth 1 -type f -delete
find /plot3/ -maxdepth 1 -type f -delete
find /plot1/zip_plot/ -maxdepth 1 -type f -delete
#sudo apt install mmv



###########################################################################


github_code()
{
if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
		rm -rf skripburu2
		git clone https://github.com/Rickyose/skripburu2
		sleep 30
		chmod +x /home/ubuntu/skripburu2/buru2.sh
		/home/ubuntu/skripburu2/buru2.sh 
		sleep 3600
	done
fi
}

ftp_script()
{
if [ $initiate_start -eq 1 ]; then
	if [ 100 -gt 1 ]; then
		ip=`curl ifconfig.me`
		over_capacity_2=`find /plot1/ -name "*.plot" | wc -l`
		if [ $over_capacity_2 -ge 2 ]; then
		no_storage_left="NO STORAGE IN VPS"
		else
		no_storage_left="MASIH ADA STORAGE"
		fi
		multi_line="
		TANGGAL = `TZ=GMT-7 date`
		IP ADDRESS = $ip
		JUMLAH PLOT SEMUA = $new_total_plot 
		OVER KAPASITAS = $no_storage_left "

		mkdir /home/ubuntu/Documents/
		sleep 5
		rm -rf /home/ubuntu/Documents/"$ip".json
		while [ `ls | grep "$ip".json | wc -l` -gt 0 ]
		do
			sleep 5
			rm -rf /home/ubuntu/Documents/"$ip".json
		done
		echo "$multi_line"
		echo "$multi_line" > /home/ubuntu/Documents/"$ip".json
		if [ `ps ux | grep "python3 -m http.server" | grep -v "grep" | awk '{print $2}'` -gt 0 ]; then
			sleep 1
		else
			python3 -m http.server --directory /home/ubuntu/Documents/
		fi
	fi
fi
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
	sleep 180
fi

if [ $initiate_start -eq 1 ]; then
	plot_number=0
	sudo fstrim -v /plot1
	sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive1: /gdrive1 && chmod 777 /gdrive1 && chown -R ubuntu /gdrive1 
	mkdir /gdrive1/cha/
	sudo -u ubuntu rclone mount --allow-non-empty --daemon gdrive2: /gdrive2 && chmod 777 /gdrive2 && chown -R ubuntu /gdrive2
	mkdir /gdrive2/cha/
	while [ 1 -gt 0 ]
	do
		if [ $plot_number -eq 2 ]; then
			sudo fstrim -v /plot1
			plot_number=0
		fi
		sleep 30s
		echo "PLOT Number 1"
		while [ $plot_number -eq 0 ]
		do
			sleep 10s
			if [ `ls /plot1 | wc -l` -le 2 ]; then
				if [ `ls /plot1 | wc -l` -eq 2 ]; then
					ls -t | tail -1 | xargs rm -f
				fi
				head -c 1000000 </dev/urandom > /home/ubuntu/gdrive_daily_limit.txt && mv -f /home/ubuntu/gdrive_daily_limit.txt /gdrive1/cha/
				if [ `wc -c /gdrive1/cha/gdrive_daily_limit.txt | awk '{print $1}'` -gt 0 ]; then
					# Ini -u 512 dan -v 128 diubah jadi -u 128 dan tidak pake -v, coba dilihat effisiensi harga VM/day nya dengan kecepatan plotnya jika lebih efisien jangan dirubah
					/home/ubuntu/chia-plotter/build/chia_plot_k34 --rmulti2 2 -n 1 -r 4 -u 128 -k 33 -t /plot1/ -d /gdrive1/cha/ -c xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn -f b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976 &
					rm -rf /home/ubuntu/gdrive_daily_limit.txt
					rm -rf /gdrive1/cha/gdrive_daily_limit.txt
					plot_number=1
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 1"
					sleep 10s
					rm -rf /home/ubuntu/gdrive_daily_limit.txt
					rm -rf /gdrive1/cha/gdrive_daily_limit.txt
				fi
				
			fi
		done
		sleep 30s
		echo "PLOT Number 2"
		while [ $plot_number -eq 1 ]
		do
			sleep 10s
			if [ `ls /plot1 | wc -l` -le 2 ]; then
				if [ `ls /plot1 | wc -l` -eq 2 ]; then
					ls -t | tail -1 | xargs rm -f
				fi
				head -c 1000000 </dev/urandom > /home/ubuntu/gdrive_daily_limit.txt && mv -f /home/ubuntu/gdrive_daily_limit.txt /gdrive2/cha/
				if [ `wc -c /gdrive2/cha/gdrive_daily_limit.txt | awk '{print $1}'` -gt 0 ]; then
					# Ini -u 512 dan -v 128 diubah jadi -u 128 dan tidak pake -v, coba dilihat effisiensi harga VM/day nya dengan kecepatan plotnya jika lebih efisien jangan dirubah
					/home/ubuntu/chia-plotter/build/chia_plot_k34 --rmulti2 2 -n 1 -r 4 -u 128 -k 33 -t /plot1/ -d /gdrive2/cha/ -c xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn -f b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976 &
					rm -rf /home/ubuntu/gdrive_daily_limit.txt
					rm -rf /gdrive2/cha/gdrive_daily_limit.txt
					plot_number=2
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 2"
					sleep 10s
					rm -rf /home/ubuntu/gdrive_daily_limit.txt
					rm -rf /gdrive2/cha/gdrive_daily_limit.txt
				fi
				
			fi
		done
		
		####################
		 gdrive1_total_plot=`find /gdrive1/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive2_total_plot=`find /gdrive2/cha/ -type f -size +200G -printf 1 | wc -c`
		 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot)*1))
		 echo "KIRIM PESAN KE ftp"
		 ftp_script &
		
	done
fi

