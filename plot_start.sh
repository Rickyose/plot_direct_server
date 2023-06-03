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
plot_number=1
export ftp_1=0
export mount_gdrive3=`df -h | grep gdrive3 | wc -l`

###########################################################################
sudo mkdir /plot1 && sudo chown -R root /plot1
sudo mkdir /plot1/zip_plot && sudo chown -R root /plot1/zip_plot
cd 
#find /plot1/ -maxdepth 1 -type f -delete
#find /plot3/ -maxdepth 1 -type f -delete
find /plot1/temp/ -maxdepth 1 -type f -delete
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
		chmod +x /root/skripburu2/buru2.sh
		/root/skripburu2/buru2.sh 
		rclone cleanup gdrive1:
		sleep 15s
		rclone cleanup gdrive2:
		sleep 15s
		rclone cleanup gdrive3:
		sleep 15s
		rclone cleanup gdrive4:
		sleep 15s
		rclone cleanup gdrive5:
		sleep 15s
		rclone cleanup gdrive6:
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
		if [ $over_capacity_2 -ge 1 ]; then
		no_storage_left="NO STORAGE IN VPS"
		else
		no_storage_left="MASIH ADA STORAGE"
		fi
		multi_line="
		TANGGAL = `TZ=GMT-7 date`
		IP ADDRESS = $ip
		JUMLAH PLOT SEMUA = $new_total_plot 
		OVER KAPASITAS = $no_storage_left "

		mkdir /root/Documents/
		sleep 5
		rm -rf /root/Documents/"$ip".json
		while [ `ls | grep "$ip".json | wc -l` -gt 0 ]
		do
			sleep 5
			rm -rf /root/Documents/"$ip".json
		done
		echo "$multi_line"
		echo "$multi_line" > /root/Documents/"$ip".json
		if [ `ps ux | grep "python3 -m http.server" | grep -v "grep" | awk '{print $2}'` -gt 0 ]; then
			sleep 1
		else
			python3 -m http.server --directory /root/Documents/
		fi
	fi
fi
}

plot_mover()
{
if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
		sleep 15s
		if [ `find /plot1/zip_plot/ -type f -size +100G | wc -l` -le 0 ]; then
			if [ `find /gdrive1/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive1/cha/
				if [ `find /gdrive1/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 1"
					mv /plot1/zip_plot/*.zip /gdrive1/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive1/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 1"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive1/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive2/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive2/cha/
				if [ `find /gdrive2/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 2"
					mv /plot1/zip_plot/*.zip /gdrive2/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive2/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 2"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive2/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive3/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive3/cha/
				if [ `find /gdrive3/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 3"
					mv /plot1/zip_plot/*.zip /gdrive3/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive3/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 3"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive3/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive4/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive4/cha/
				if [ `find /gdrive4/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 4"
					mv /plot1/zip_plot/*.zip /gdrive4/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive4/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 4"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive4/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive5/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive5/cha/
				if [ `find /gdrive5/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 5"
					mv /plot1/zip_plot/*.zip /gdrive5/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive5/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 5"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive5/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive6/cha -type f -size +1G | wc -l` -le 0 ]; then
				head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive6/cha/
				if [ `find /gdrive6/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 6"
					mv /plot1/zip_plot/*.zip /gdrive6/cha/
					rm -rf /plot1/zip_plot/*.zip
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive6/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 6"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive6/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
		fi
	done
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
	sleep 30
	plot_mover &
	echo Menjalankan PLOT MOVER
	sleep 180
fi

if [ $initiate_start -eq 1 ]; then
	plot_number=0
	mkdir /plot1/temp/
	mkdir /gdrive1/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive1: /gdrive1 && chmod 777 /gdrive1 && chown -R root /gdrive1 
	mkdir /gdrive2/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive2: /gdrive2 && chmod 777 /gdrive2 && chown -R root /gdrive2
	mkdir /gdrive3/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive3: /gdrive3 && chmod 777 /gdrive3 && chown -R root /gdrive3
	mkdir /gdrive4/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive4: /gdrive4 && chmod 777 /gdrive4 && chown -R root /gdrive4
	mkdir /gdrive5/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive5: /gdrive5 && chmod 777 /gdrive5 && chown -R root /gdrive5
	mkdir /gdrive6/cha/
	sudo -u root rclone mount --allow-non-empty --daemon gdrive6: /gdrive6 && chmod 777 /gdrive6 && chown -R root /gdrive6
	sudo fstrim -v /plot1

	while [ 1 -gt 0 ]
	do
		while [ $plot_number -ge 2 ]
		do
			if [ `find /plot1/zip_plot -type f -size +100G | wc -l` -ge 2 ]; then
				echo /plot1/zip_plot Sudah Over CAPACITY
				sleep 30s
			else
				sudo fstrim -v /plot1
				plot_number=1
			fi
		done
		sleep 30s
		echo "PLOT Number $plot_number"
		while [ $plot_number -lt 3 ]
		do
			sleep 10s
			if [ `ls /plot1/temp | wc -l` -le 2 ]; then
				if [ `ls /plot1/temp | wc -l` -eq 2 ]; then
					ls -t | tail -1 | xargs rm -f
				fi
				# Ini -u 512 dan -v 128 diubah jadi -u 128 dan tidak pake -v, coba dilihat effisiensi harga VM/day nya dengan kecepatan plotnya jika lebih efisien jangan dirubah
				/root/chia-plotter/build/chia_plot_k34 --rmulti2 2 -n 1 -r 2 -u 256 -k 33 -t /plot1/temp/ -d /plot1/zip_plot/ -c xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn -f b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976
				acak_1=$[RANDOM%999999999999+100000000000]
				sudo -u root nice --1 zip -r -0 -m /plot1/zip_plot/$acak_1.zip /plot1/zip_plot/*plot
				plot_number=$((($plot_number + 1)*1))
			else
				find /plot1/temp/ -maxdepth 1 -type f -delete
			fi
		done

		
		####################
		 gdrive1_total_plot=`find /gdrive1/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive2_total_plot=`find /gdrive2/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive3_total_plot=`find /gdrive3/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive4_total_plot=`find /gdrive4/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive5_total_plot=`find /gdrive5/cha/ -type f -size +200G -printf 1 | wc -c`
		 gdrive6_total_plot=`find /gdrive6/cha/ -type f -size +200G -printf 1 | wc -c`
		 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot + $gdrive3_total_plot + $gdrive4_total_plot + $gdrive5_total_plot + $gdrive6_total_plot)*1))
		 echo "KIRIM PESAN KE ftp"
		 ftp_script &
		
	done
fi
