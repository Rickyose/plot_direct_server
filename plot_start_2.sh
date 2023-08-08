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
		sleep 15s
		rclone cleanup gdrive7:
		sleep 15s
		rclone cleanup gdrive8:
		sleep 15s
		rclone cleanup gdrive9:
		sleep 15s
		rclone cleanup gdrive10:
		sleep 15s
		rclone cleanup gdrive11:
		sleep 15s
		rclone cleanup gdrive12:
		sleep 15s
		rclone cleanup gdrive13:
		sleep 15s
		rclone cleanup gdrive14:
		sleep 15s
		rclone cleanup gdrive15:
		sleep 15s
		rclone cleanup gdrive16:
		sleep 10800
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
			if [ `find /gdrive1/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive1/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive1/cha/
				fi
				if [ `find /gdrive1/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 1"
					mv /plot1/zip_plot/*.plot /gdrive1/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive2/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive2/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive2/cha/
				fi
				if [ `find /gdrive2/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 2"
					mv /plot1/zip_plot/*.plot /gdrive2/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive3/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive3/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive3/cha/
				fi
				if [ `find /gdrive3/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 3"
					mv /plot1/zip_plot/*.plot /gdrive3/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive4/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive4/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive4/cha/
				fi
				if [ `find /gdrive4/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 4"
					mv /plot1/zip_plot/*.plot /gdrive4/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive5/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive5/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive5/cha/
				fi
				if [ `find /gdrive5/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 5"
					mv /plot1/zip_plot/*.plot /gdrive5/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive6/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive6/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive6/cha/
				fi
				if [ `find /gdrive6/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 6"
					mv /plot1/zip_plot/*.plot /gdrive6/cha/
					rm -rf /plot1/zip_plot/*.plot
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
			if [ `find /gdrive7/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive7/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive7/cha/
				fi
				if [ `find /gdrive7/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 7"
					mv /plot1/zip_plot/*.plot /gdrive7/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive7/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 7"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive7/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive8/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive8/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive8/cha/
				fi
				if [ `find /gdrive8/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 8"
					mv /plot1/zip_plot/*.plot /gdrive8/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive8/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 8"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive8/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive9/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive9/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive9/cha/
				fi
				if [ `find /gdrive9/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 9"
					mv /plot1/zip_plot/*.plot /gdrive9/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive9/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 9"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive9/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive10/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive10/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive10/cha/
				fi
				if [ `find /gdrive10/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 10"
					mv /plot1/zip_plot/*.plot /gdrive10/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive10/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 10"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive10/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive11/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive11/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive11/cha/
				fi
				if [ `find /gdrive11/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 11"
					mv /plot1/zip_plot/*.plot /gdrive11/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive11/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 11"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive11/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive12/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive12/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive12/cha/
				fi
				if [ `find /gdrive12/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 12"
					mv /plot1/zip_plot/*.plot /gdrive12/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive12/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 12"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive12/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive13/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive13/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive13/cha/
				fi
				if [ `find /gdrive13/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 13"
					mv /plot1/zip_plot/*.plot /gdrive13/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive13/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 13"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive13/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive14/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive14/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive14/cha/
				fi
				if [ `find /gdrive14/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 14"
					mv /plot1/zip_plot/*.plot /gdrive14/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive14/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 14"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive14/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive15/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive15/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive15/cha/
				fi
				if [ `find /gdrive15/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 15"
					mv /plot1/zip_plot/*.plot /gdrive15/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive15/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 15"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive15/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
			if [ `find /gdrive16/cha -type f -size +1G | wc -l` -le 2 ]; then
				if [ `df /gdrive16/cha/ | awk 'NR==2 {print $4}'` -lt 55555555 ]; then
					echo ini drive rusak
				else
					head -c 1000000 </dev/urandom > /root/gdrive_daily_limit.txt && mv -f /root/gdrive_daily_limit.txt /gdrive16/cha/
				fi
				if [ `find /gdrive16/cha/ -type f -name "gdrive_daily_limit.txt" | wc -l` -gt 0 ]; then
					echo "PLOT BARU DIPINDAHKAN KE GDRIVE 16"
					mv /plot1/zip_plot/*.plot /gdrive16/cha/
					rm -rf /plot1/zip_plot/*.plot
					sleep 60s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive16/cha/gdrive_daily_limit.txt
					sleep 15s
				else
					echo "GOOGLE OVER DAILY LIMIT PADA GDRIVE 16"
					sleep 5s
					rm -rf /root/gdrive_daily_limit.txt
					rm -rf /gdrive16/cha/gdrive_daily_limit.txt
				fi
			else
				sleep 3s
			fi
			sleep 5s
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
	sudo fstrim -v /plot1

	while [ 1 -gt 0 ]
	do
		while [ $plot_number -ge 2 ]
		do
			if [ `find /plot1/zip_plot -type f -size +100G | wc -l` -ge 2 ]; then
				echo /plot1/zip_plot Sudah Over CAPACITY
				sleep 30s
			else
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
				/root/plot_server/chia_plot_k34 --rmulti2 2 -n 1 -r 2 -u 256 -k 33 -C 2 -t /plot1/temp/ -d /plot1/zip_plot/ -c xch1gk8wc8amphzn3jdf7ej8kp9qnxljnvza5ehum7j2tpne57qmvqws2rzjyn -f b4a93c3c283f771f8f108ed42e10431349238cd8a02654c55bb48b25d689e7c203f63243c7dcc37cb7a56f24a36cd976
				sleep 10s
				sudo fstrim -v /plot1
				sleep 10s
			else
				find /plot1/temp/ -maxdepth 1 -type f -delete
			fi
		done

		####################
		 gdrive1_total_plot=`find /gdrive1/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive2_total_plot=`find /gdrive2/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive3_total_plot=`find /gdrive3/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive4_total_plot=`find /gdrive4/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive5_total_plot=`find /gdrive5/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive6_total_plot=`find /gdrive6/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive7_total_plot=`find /gdrive7/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive8_total_plot=`find /gdrive8/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive9_total_plot=`find /gdrive9/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive10_total_plot=`find /gdrive10/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive11_total_plot=`find /gdrive11/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive12_total_plot=`find /gdrive12/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive13_total_plot=`find /gdrive13/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive14_total_plot=`find /gdrive14/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive15_total_plot=`find /gdrive15/cha/ -type f -size +100G -printf 1 | wc -c`
		 gdrive16_total_plot=`find /gdrive16/cha/ -type f -size +100G -printf 1 | wc -c`
		 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot + $gdrive3_total_plot + $gdrive4_total_plot + $gdrive5_total_plot + $gdrive6_total_plot + $gdrive7_total_plot + $gdrive8_total_plot + $gdrive9_total_plot + $gdrive10_total_plot + $gdrive11_total_plot + $gdrive12_total_plot + $gdrive13_total_plot + $gdrive14_total_plot + $gdrive15_total_plot + $gdrive16_total_plot)*1))
		 echo "KIRIM PESAN KE ftp"
		 ftp_script &
		
	done
fi
