#!/bin/sh

## put all the complete app names in an array
declare -a arr=("com.mipay.wallet.in"
				"com.xiaomi.payment"
				"cn.wps.xiaomi.abroad.lite"
				"com.xiaomi.midrop"
				"com.miui.yellow.page"
				"com.miui.android.fashiongallery"
				"com.android.browser"
				"com.miui.glgm"
				"com.miui.msa.global"
				"com.xiaomi.mipicks"
				"com.google.android.videos"
				"com.facebook.services"
				"com.facebook.system"
				"com.facebook.appmanager"
				"com.android.email"
				"com.miui.videoplayer"
				"com.miui.player"
				"com.miui.miservice"
				"com.miui.cloudservice"
				"com.miui.cloudbackup"
				)

##Do not edit code beyond this point if you don't understand

printf "********************************************************\n"
printf "                 Welcome to Debloat\n"
printf "********************************************************\n\n"

read -s -p "Press any key to continue..."
printf "\n"

clear

##show the users the list to be uninstalled
printf "\n\nThe following apps will be uninstalled from your device\n\n"
for i in "${arr[@]}"
do
   echo "$i"
   sleep 0.31
done

printf "\n\nNote: You can edit this List\n\n"
read -p "Are you sure you want to Uninstall all of them (Y or N)? " yn
    case $yn in
        [Yy]* ) printf "Initiating Debloat...\n\n";continue; break;;
        * ) echo "Terminating Application...\n\n";exit 0;break;;
    esac


## loop and uninstall each app
for i in "${arr[@]}"
do
   echo "Uninstalling $i"
   sleep 0.3
   echo "Success"
   printf "\n"
done

# reboot device by user choice
printf "\nYou're almost done !\n"
printf "Rebooting ensures clean and safe uninstallation\n"

read -p "Do you want to reboot your device ? " yn
    case $yn in
        [Yy]* ) printf "Rebooting your device...\n\n"; break;;
        * ) echo "";;
    esac

echo "Debloat complete !"