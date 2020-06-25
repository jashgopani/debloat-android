#!/bin/sh
printf "Initiating debloat\n"

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

## loop and uninstall each app
for i in "${arr[@]}"
do
   echo "Uninstalling $i"
   echo ""
   adb shell pm uninstall -k --user 0 "$i"
   printf "\n"
done

# reboot device by user choice
printf "\nYou're almost done !\n"
printf "Rebooting ensures clean and safe uninstallation\n"

read -p "Do you want to reboot your device ? " yn
    case $yn in
        [Yy]* ) printf "Rebooting your device...\n\n";adb reboot; break;;
        * ) echo "";;
    esac

echo "Debloat complete !"