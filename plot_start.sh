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


######################### VARIABLE YG TIDAK DIUBAH ########################
N=0
initiate1=0
initiate2=0
initiate_start=0
export ftp_1=0
export mount_gdrive3=`df -h | grep gdrive3 | wc -l`

###########################################################################
sudo mkdir /plot1/zip_plot && sudo chown -R ubuntu /plot1/zip_plot
cd 
find /plot1/ -maxdepth 1 -type f -delete
find /plot3/ -maxdepth 1 -type f -delete
find /plot1/zip_plot/ -maxdepth 1 -type f -delete
#sudo apt install mmv

#################################### Proses Menandai tempat Plot ##############################


if [ ! -f source_dir_list.txt ]; then
	read -p "Google Cloud Nomer: " GC_Nomer
	sleep 3
	export gdrive1="gdrive"$(($GC_Nomer))
	export gdrive2="gdrive"$(($GC_Nomer + 1))
	export gdrive3="gdrive"$(($GC_Nomer + 2))
	export clientfolder1=temp
	export clientfolder2=temp
	export clientfolder3=temp
	
	while [ `df -h | grep $gdrive1 | wc -l` -eq 0 ] || [ `df -h | grep $gdrive2 | wc -l` -eq 0 ] || [ `df -h | grep $gdrive3 | wc -l` -eq 0 ]
	do
	echo GOOGLE DRIVE BELUM DI MOUNT
	sleep 60
	done
	
	multi_line="/$gdrive1/
/$gdrive2/
/$gdrive3/"
	echo "$multi_line" > source_dir_list.txt

mkdir /"$gdrive1"/"$clientfolder1"
mkdir /"$gdrive2"/"$clientfolder2"
mkdir /"$gdrive3"/"$clientfolder3"
export gdrive1=`cat source_dir_list.txt | sed -n 1P`
export gdrive2=`cat source_dir_list.txt | sed -n 2P`
export gdrive3=`cat source_dir_list.txt | sed -n 3P`
export clientfolder1=temp
export clientfolder2=temp
export clientfolder3=temp

else
	export gdrive1=`cat source_dir_list.txt | sed -n 1P | sed 's/^\///;s/\// /g'`
	export gdrive2=`cat source_dir_list.txt | sed -n 2P | sed 's/^\///;s/\// /g'`
	export gdrive3=`cat source_dir_list.txt | sed -n 3P | sed 's/^\///;s/\// /g'`
	export clientfolder1=temp
	export clientfolder2=temp
	export clientfolder3=temp
	sleep 3
	while [ `df -h | grep $gdrive1 | wc -l` -eq 0 ] || [ `df -h | grep $gdrive2 | wc -l` -eq 0 ] || [ `df -h | grep $gdrive3 | wc -l` -eq 0 ]
	do
		echo GOOGLE DRIVE BELUM DI MOUNT
		sleep 60
	done
	export gdrive1=`cat source_dir_list.txt | sed -n 1P`
	export gdrive2=`cat source_dir_list.txt | sed -n 2P`
	export gdrive3=`cat source_dir_list.txt | sed -n 3P`
	export clientfolder1=temp
	export clientfolder2=temp
	export clientfolder3=temp
fi

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
		over_capacity=`find /plot1/zip_plot/ -name "*.zip" | wc -l`
		over_capacity_2=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
		if [ $over_capacity -gt 1 ] || [ $over_capacity_2 -gt 3 ]; then
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

zip_process()
{
acak_1=$[RANDOM%999999999999+100000000000]
ada_plot_1=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
sukses_send_plot_1=0

while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]
do
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive1""$clientfolder1"
		sukses_send_plot_1=1
	fi
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive2""$clientfolder2"
		sukses_send_plot_2=1
	fi
	if [ $mount_gdrive3 -eq 1 ]; then
		if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
			mv /plot1/zip_plot/*.zip "$gdrive3""$clientfolder3"
			sukses_send_plot_3=1
		fi
	fi
	sleep 120
done


while [ $sukses_send_plot_1 -eq 0 ]
do
	while [ $ada_plot_1 -ge 2 ]; do
		echo ZIP PROSES BERJALAN
		sudo -u root nice --1 zip -r -0 -m /plot1/zip_plot/$acak_1.zip /plot1/zip_plot/*plot && sudo -u root chown -R ubuntu /plot1/zip_plot/*.zip && sudo -u ubuntu chmod 777 /plot1/zip_plot/*.zip 
		mv /plot1/zip_plot/*.zip "$gdrive1""$clientfolder1"
		send_zip_1=`find "$gdrive1""$clientfolder1" -name "$acak_1.zip" | wc -l`
		sukses_send_plot_1=1
		if [ $send_zip_1 -gt 0 ]; then
			echo "SUKSES Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1""
		else
			echo "==================================== GAGAL Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1" ========================================================="
			#while [ `find /plot1/zip_plot/ -name "$acak_1.zip" | wc -l` -gt 0 ]
			#do
			#sleep 30
			#find /plot1/zip_plot/ -type f -name "$acak_1.zip" -delete
			#sleep 30
			#done
		fi
		ada_plot_1=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
		sleep 60
	done
	ada_plot_1=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
	echo "WAIT ADA PLOT UNTuK GDRIVE 1"
	sleep 60
done

acak_2=$[RANDOM%999999999999+100000000000]
ada_plot_2=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
sukses_send_plot_2=0

while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]
do
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive1""$clientfolder1"
		sukses_send_plot_1=1
	fi
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive2""$clientfolder2"
		sukses_send_plot_2=1
	fi
	if [ $mount_gdrive3 -eq 1 ]; then
		if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
			mv /plot1/zip_plot/*.zip "$gdrive3""$clientfolder3"
			sukses_send_plot_3=1
		fi
	fi
	sleep 120
done

while [ $sukses_send_plot_2 -eq 0 ]
do
	while [ $ada_plot_2 -ge 2 ]; do
		echo ZIP PROSES BERJALAN
		sudo -u root nice --1 zip -r -0 -m /plot1/zip_plot/$acak_2.zip /plot1/zip_plot/*plot && sudo -u root chown -R ubuntu /plot1/zip_plot/*.zip && sudo -u ubuntu chmod 777 /plot1/zip_plot/*.zip
		mv /plot1/zip_plot/*.zip "$gdrive2""$clientfolder2"
		send_zip_2=`find "$gdrive2""$clientfolder2" -name "$acak_2.zip" | wc -l`
		sukses_send_plot_2=1
		if [ $send_zip_2 -gt 0 ]; then
			echo "SUKSES Pindahkan $acak_2.zip ke "$gdrive2""$clientfolder2""
		else
			echo "==================================== GAGAL Pindahkan $acak_2.zip ke "$gdrive2""$clientfolder2" ========================================================="
		fi
		ada_plot_2=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
		sleep 60
	done
	ada_plot_2=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
	echo "WAIT ADA PLOT UNTuK GDRIVE 2"
	sleep 60
done

if [ $mount_gdrive3 -eq 1 ]; then
acak_3=$[RANDOM%999999999999+100000000000]
ada_plot_3=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
sukses_send_plot_3=0

while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]
do
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive1""$clientfolder1"
		sukses_send_plot_1=1
	fi
	if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
		mv /plot1/zip_plot/*.zip "$gdrive2""$clientfolder2"
		sukses_send_plot_2=1
	fi
	if [ $mount_gdrive3 -eq 1 ]; then
		if [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 0 ]; then
			mv /plot1/zip_plot/*.zip "$gdrive3""$clientfolder3"
			sukses_send_plot_3=1
		fi
	fi
	sleep 120
done

while [ $sukses_send_plot_3 -eq 0 ]
do
	while [ $ada_plot_3 -ge 2 ]; do
		echo ZIP PROSES BERJALAN
		sudo -u root nice --1 zip -r -0 -m /plot1/zip_plot/$acak_3.zip /plot1/zip_plot/*plot && sudo -u root chown -R ubuntu /plot1/zip_plot/*.zip && sudo -u ubuntu chmod 777 /plot1/zip_plot/*.zip
		mv /plot1/zip_plot/*.zip "$gdrive3""$clientfolder3"
		send_zip_3=`find "$gdrive3""$clientfolder3" -name "$acak_3.zip" | wc -l`
		sukses_send_plot_3=1
		if [ $send_zip_3 -gt 0 ]; then
			echo "SUKSES Pindahkan $acak_3.zip ke "$gdrive3""$clientfolder3""
		else
			echo "==================================== GAGAL Pindahkan $acak_3.zip ke "$gdrive3""$clientfolder3" ========================================================="
		fi
		ada_plot_3=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
		sleep 60
	done
	ada_plot_3=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
	echo "WAIT ADA PLOT UNTuK GDRIVE 3"
	sleep 60
done
fi


if [ $initiate_start -eq 1 ]; then
zip_process
fi
}

start:

if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
	 while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 1 ] || [ `find /plot1/zip_plot/ -name "*.zip" | wc -l`-gt 2 ]
	 do
		 echo "PLOT LEBIH DARI 3, AWAS PLOTTING OVER CAPACITY"
		 sleep 60
	 done
	 sudo fstrim -v /plot1
	 /home/ubuntu/chia-plotter/build/chia_plot --rmulti2 2 -n 2 -r 4 -u 512 -v 128 -t /plot1/ -d /plot1/zip_plot/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 N=$(($N + 2))
	 echo Mengerjakan Plot Order $clientfolder1 Jumlah Plot yang dikerjakan sudah $N
	 ####################
	 gdrive1_total_plot=`find "$gdrive1""$clientfolder1"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive2_total_plot=`find "$gdrive2""$clientfolder2"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive3_total_plot=`find "$gdrive3""$clientfolder3"/ -type f -size +200G -printf 1 | wc -c`
	 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot + $gdrive3_total_plot)*2))
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &
	 #if [ $ftp_1 -eq 0 ]; then
	 #export ftp_1=1
	 #echo "KIRIM PESAN KE ftp"
	 #ftp_script &
	 #fi
	done
fi


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
zip_process &
echo Menjalankan ZIP Proses
sleep 180
jumpto $start
fi
