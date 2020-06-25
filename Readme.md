# Debloat / Uninstall System Apps on Android (without Root)

Debloat is a simple _bash script_ that helps you **uninstall system apps without rooting** your phone from your pc ! It is easy to use as well as customise. 

  - Compatible with Windows/Linux/MacOS
  - Does not void your warranty
  - You can reinstall the apps in future without any issues
  - Works for all **Android** phones

## Setup and Requirements

  - ADB ([Download & Setup Instructions](https://www.google.com) | For **Windows & Mac** only)
  - Git Bash ([Download](https://gitforwindows.org/) | Only for **Windows** users )
  - _Windows users_ **add adb to your PATH variable**
  - **Enable Developer Options** on your android device. (_Checkout the adb link for the same_)
  - Download this repository / copy the script

## Running the script


 - If you are on Windows, use `Git Bash` .
 - If you are on Linux / MacOS, use ```terminal```.
 - **run the command**   ``` ./<relative-path>/debloat.sh``` in your terminal.
 - and the rest will be visible to you on your terminal :)

## Adding / Removing apps

> **Note:** If the app isn't present on your device, it won't affect the execution of script. It will just show an error **_app not found on 0_**

The part of the script shown below has complete names of all the apps in an array, you can add/remove apps from here.  
The list below contains some system services/apps which are not used or generate ads.
```

# put all the complete app names in an array.

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
```



