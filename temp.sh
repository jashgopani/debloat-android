#!/bin/sh

#Application name array
declare -a apps=("com.mipay.wallet.in"
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

#############  DO NOT EDIT BEYOND THIS POINT #############

# Utility functions start

## for clearing the terminal
cls(){
	clear
}

## for printing the top title box
title(){
    cls
	printf "********************************************************\n"
	printf "\t\t$1\n"
	printf "********************************************************\n\n"
}

tag_msg(){
    printf "$1 : $2\n"
}

# Title and desciprtion of application
app_header(){
    title "Welcome to Debloat"
    printf "Debloat helps you to uninstall System/Third-party Apps on your \nandroid device without voiding your warranty."
    echo ""
    echo ""
    adb devices
    tag_msg "Note" "If your device is not shown above,\ndisconnect and reconnect your device,and select reload from menu"
}

## print apps array
print_default_apps(){
    title "Default App List"
    for i in "${apps[@]}"
    do
    echo "$i"
    sleep 0.05
    done
    press_any_key
}

## uninstalling app passed as parameter
uninstallApp(){
    adb shell pm uninstall -k --user 0 $1
    echo ""
}

##uninstall all apps in one go
complete_uninstall_default_apps(){
    title "Complete Uninstall Default Apps List"
    printf "This action cannot be undone !\n"
    read -p "Do you want to proceed ? (y or n)" yn
    case $yn in
    [Yy]* )
        for i in "${apps[@]}"
        do
        echo "Uninstalling $i"
        uninstallApp $i
        done
        break
        ;;
    * ) break;;
    esac
    tag_msg "Info" "If apps are not uninstalled after reboot, try uninstalling them again :)"
    press_any_key
}

selective_uninstall_default_apps(){
    
    title "Selective Uninstall Default Apps List"
    tag_msg "Note" "Y = yes , N = no , Q = quit and return to menu"
    press_any_key

    for i in "${apps[@]}"
    do  
        read -p "Uninstall -->  $i ?  (y / n / q) >> " yn
        case $yn in
        [Yy]* )
            printf "Uninstalling $i\n"
            uninstallApp $i
            echo ""
            ;;
        [Qq]* )
            printf "Stopping this process..."
            return -1
            break;;
        * ) 
            printf "Skipped $i\n"
            echo ""
            continue;;
        esac
    done

    tag_msg "Info" "If apps are not uninstalled after reboot, try uninstalling them again :)"
    press_any_key
}

uninstall_user_choice(){
    title "uninstall App of your choice"
    tag_msg "Note" "Enter full app name i.e with package e.g com.example.androidApp"

    read -p "Enter App Name here >> " an
    uninstallApp $an

    tag_msg "Info" "If apps are not uninstalled after reboot, try uninstalling them again :)"
    press_any_key
}

reboot_device(){
    title "Reboot device"
    printf "Rebooting......\n"
    adb reboot
    press_any_key
}

## Menu function
menu(){
    app_header
    printf "\nChoose an option"
    # printf "\n------------------------------------------"
    printf "\n1. View Default Apps List"
    printf "\n2. Complete Uninstall Default Apps List"
    printf "\n3. Selective Uninstall Default Apps List"
    printf "\n4. Uninstall App of your choice"
    printf "\n5. Reboot Device"
    printf "\n6. Reload Menu"
    printf "\nQ. Quit\n\n"
    # printf "\n------------------------------------------\n"
    read -p "Your choice >> " ip
    menu_choice_handler $ip
    unset $ip
}

## handle user choice from menu
menu_choice_handler(){
case $1 in
        [1])
            print_default_apps
            menu
            break
            ;;
        [2])
            complete_uninstall_default_apps
            menu
            break
            ;;
        [3])
            selective_uninstall_default_apps
            menu
            break
            ;;
        [4])
            uninstall_user_choice
            menu
            break
            ;;
        [5])
            reboot_device
            menu
            break
            ;;
        [6])
            menu
            break
            ;;    
        [Qq]* ) 
			printf "Thankyou for using Debloat :)\n"
			exit 0
			break
			;;
        * )	
			printf "Choose a valid choice"
            press_any_key
			menu
			;;
    esac
}

# Wait for user input to proceed
press_any_key(){
    echo ""
    tag_msg "Info" "Restarting / Rebooting ensures clean uninstallation of apps !\n"
    read -s -p "Press any key to continue..." key
    printf "\n\n"
    unset $key
}

#Utility functions end

# Main program
menu