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

######################### VARIABLE YG TIDAK DIUBAH ########################
N=0
initiate1=0
initiate2=0
initiate_start=0
export ftp_1=0
###########################################################################
sudo mkdir /plot1/zip_plot && sudo chown -R ubuntu /plot1/zip_plot
cd && cd "$gdrive1" && mkdir "$clientfolder1"
cd && cd "$gdrive2" && mkdir "$clientfolder2"
cd 
find /plot1/ -maxdepth 1 -type f -delete
find /plot3/ -maxdepth 1 -type f -delete
find /plot1/zip_plot/ -maxdepth 1 -type f -delete
sudo apt install mmv

#################################### Proses Menandai tempat Plot ##############################

if [ ! -f source_dir_list.txt ]; then
	sleep 3
else
	penanda_tempat_plot_1=0
	acak_plot_1=1
	v_source_line_count=`cat source_dir_list.txt | wc -l`
	count_1=0
	tempat_plot_1()
	{
	while [[ $penanda_tempat_plot_1 -eq 0 && $count_1 -le $v_source_line_count ]];
	do
		export v_source_dir=`cat source_dir_list.txt | sed -n "$N"P`
		count_1=$(($count_1 + 1))
		rm -rf ${v_source_dir}/`curl ifconfig.me`.txt
		if [ `ls ${v_source_dir}/ | grep .txt | wc -l` -eq 0 ]; then
			touch ${v_source_dir}/`curl ifconfig.me`.txt
			acak_plot_2=$[RANDOM%60+5]
			wait $acak_plot_2
			while [[ `ls ${v_source_dir}/ | grep .txt | wc -l` -ge 2 && $acak_plot_1 -eq 1 ]];
			do
				acak_plot_2=$[RANDOM%60+5]
				wait $acak_plot_2
				acak_plot_1=$[RANDOM%2+1]
				sleep 1
			done
			if [ `ls ${v_source_dir}/ | grep .txt | wc -l` -eq 1 ]; then
				penanda_tempat_plot_1=1
				gdrive1=${v_source_dir}
				suffix="temp"
				gdrive1=${gdrive1%"$suffix"}
			else
				echo cari gdrive lain
			fi
		else
			echo cari gdrive lain
		fi
	done

	}
	if [ $penanda_tempat_plot_1 -eq 0 ]; then
	count_1=0
	tempat_plot_1
	fi
	penanda_tempat_plot_2=0
	acak_plot_1=1
	v_source_line_count=`cat source_dir_list.txt | wc -l`
	count_2=0
	tempat_plot_2()
	{
	while [[ $penanda_tempat_plot_2 -eq 0 && $count_2 -le $v_source_line_count ]];
	do
		export v_source_dir=`cat source_dir_list.txt | sed -n "$N"P`
		count_2=$(($count_2 + 1))
		if [ "$gdrive1""temp" = "$v_source_dir" ]; then
			echo skip "$v_source_dir" karena sudah dipake sebagai tempat plot no 1
			sleep 10
		else
			rm -rf ${v_source_dir}/`curl ifconfig.me`.txt
			if [ `ls ${v_source_dir}/ | grep .txt | wc -l` -eq 0 ]; then
				touch ${v_source_dir}/`curl ifconfig.me`.txt
				acak_plot_2=$[RANDOM%60+5]
				wait $acak_plot_2
				while [[ `ls ${v_source_dir}/ | grep .txt | wc -l` -ge 2 && $acak_plot_1 -eq 1 ]];
				do
					acak_plot_2=$[RANDOM%60+5]
					wait $acak_plot_2
					acak_plot_1=$[RANDOM%2+1]
					sleep 1
				done
				if [ `ls ${v_source_dir}/ | grep .txt | wc -l` -eq 1 ]; then
					penanda_tempat_plot_2=1
					gdrive2=${v_source_dir}
					suffix="temp"
					gdrive2=${gdrive2%"$suffix"}
				else
					echo cari gdrive lain
				fi
			else
				echo cari gdrive lain
			fi
		fi
	done

	}
	if [ $penanda_tempat_plot_2 -eq 0 ]; then
	count_2=0
	tempat_plot_2
	fi
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
		cd skripburu2
		chmod +x buru2.sh
		./buru2.sh 
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
		cd /home/ubuntu/Documents/
		rm -rf "$ip".json
		while [ `ls | grep "$ip".json | wc -l` -gt 0 ]
		do
			sleep 5
			rm -rf "$ip".json
		done
		echo "$multi_line"
		echo "$multi_line" > /home/ubuntu/Documents/"$ip".json
		if [ `ps ux | grep "python3 -m http.server" | grep -v "grep" | awk '{print $2}'` -gt 0 ]; then
			sleep 1
		else
			python3 -m http.server
		fi
	fi
fi
}

zip_process()
{
acak_1=$[RANDOM%999999999999+100000000000]
ada_plot_1=`find /plot1/zip_plot/ -name "*.plot" | wc -l`
sukses_send_plot_1=0

while [ $sukses_send_plot_1 -eq 0 ]
do
	while [ $ada_plot_1 -ge 2 ]; do
		echo ZIP PROSES BERJALAN
		cd /plot1/zip_plot/ 
		pwd && echo `ls`
		sudo -u root nice --1 zip -r -0 -m $acak_1.zip *plot && sudo -u root chown -R ubuntu *.zip && sudo -u ubuntu chmod 777 *.zip 
		mv *.zip "$gdrive1""$clientfolder1"
		send_zip_1=`find "$gdrive1""$clientfolder1" -name "$acak_1.zip" | wc -l`
		sukses_send_plot_1=1
		if [ $send_zip_1 -gt 0 ]; then
			echo "SUKSES Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1""
		else
			echo "==================================== GAGAL Pindahkan $acak_1.zip ke "$gdrive1""$clientfolder1" ========================================================="
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

while [ $sukses_send_plot_2 -eq 0 ]
do
	while [ $ada_plot_2 -ge 2 ]; do
		echo ZIP PROSES BERJALAN
		cd /plot1/zip_plot/ 
		pwd && echo `ls`
		sudo -u root nice --1 zip -r -0 -m $acak_2.zip *plot && sudo -u root chown -R ubuntu *.zip && sudo -u ubuntu chmod 777 *.zip
		mv *.zip "$gdrive2""$clientfolder2"
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




if [ $initiate_start -eq 1 ]; then
zip_process
fi
}

start:

if [ $initiate_start -eq 1 ]; then
	while [ $N -le $amountplot ]
	do
	 while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 1 ]
	 do
		 echo "PLOT LEBIH DARI 3, AWAS PLOTTING OVER CAPACITY"
		 sleep 60
	 done
	 sudo fstrim -v /plot1
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot --rmulti2 2 -n 2 -r 4 -u 512 -v 128 -t /plot1/ -d /plot1/zip_plot/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd
	 while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 1 ]
	 do
		 echo "PLOT LEBIH DARI 3, AWAS PLOTTING OVER CAPACITY"
		 sleep 60
	 done
	 sudo fstrim -v /plot1
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot --rmulti2 2 -n 2 -r 4 -u 512 -v 128 -t /plot1/ -d /plot1/zip_plot/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd 
	 N=$(($N + 4))
	 echo Mengerjakan Plot Order $clientfolder1 Jumlah Plot yang dikerjakan sudah $N
	 ##########################
	 gdrive1_total_plot=`find "$gdrive1""$clientfolder1"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive2_total_plot=`find "$gdrive2""$clientfolder2"/ -type f -size +200G -printf 1 | wc -c`
	 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot)*2))
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &
	 #if [ $ftp_1 -eq 0 ]; then
	 #export ftp_1=1
	 #echo "KIRIM PESAN KE ftp"
	 #ftp_script &
	 #fi
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
cd 


if [ $initiate_start -eq 1 ]; then
	while [ 100 -gt 1 ]
	do
	 while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 1 ]
	 do
		 echo "PLOT LEBIH DARI 3, AWAS PLOTTING OVER CAPACITY"
		 sleep 60
	 done
	 sudo fstrim -v /plot1
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot --rmulti2 2 -n 2 -r 4 -u 512 -v 128 -t /plot1/ -d /plot1/zip_plot/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd 
	 while [ `find /plot1/zip_plot/ -name "*.zip" | wc -l` -gt 1 ]
	 do
		 echo "PLOT LEBIH DARI 3, AWAS PLOTTING OVER CAPACITY"
		 sleep 60
	 done
	 sudo fstrim -v /plot1
	 cd /home/ubuntu/chia-plotter/build/ && ./chia_plot --rmulti2 2 -n 2 -r 4 -u 512 -v 128 -t /plot1/ -d /plot1/zip_plot/ -c "$poolkey" -f "$farmkey"
	 echo "PRESS CTRL+C to cancel script"
	 sleep 20
	 cd 
	 N=$(($N + 4))
	 echo Mengerjakan Plot Order $clientfolder1 Jumlah Plot yang dikerjakan sudah $N
	 ####################
	 gdrive1_total_plot=`find "$gdrive1""$clientfolder1"/ -type f -size +200G -printf 1 | wc -c`
	 gdrive2_total_plot=`find "$gdrive2""$clientfolder2"/ -type f -size +200G -printf 1 | wc -c`
	 new_total_plot=$((($gdrive1_total_plot + $gdrive2_total_plot)*2))
	 echo "KIRIM PESAN KE ftp"
	 ftp_script &
	 #if [ $ftp_1 -eq 0 ]; then
	 #export ftp_1=1
	 #echo "KIRIM PESAN KE ftp"
	 #ftp_script &
	 #fi
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
zip_process &
echo Menjalankan ZIP Proses
sleep 180
jumpto $start
fi
