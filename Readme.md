# Debloat / Uninstall System Apps on Android (without Root)

Debloat is a simple _bash script_ that helps you **uninstall system apps without rooting** your phone from your pc ! It is easy to use as well as customise. 

  - Compatible with Windows/Linux/MacOS
  - Does not void your warranty
  - You can reinstall the apps in future without any issues
  - Works for all **Android** phones
  - Can be used to **uninstall third-party / non-system** apps also.
  
## Screenshots

![Run command](https://github.com/jashgopani/Debloat/blob/master/screenshots/debloat1.PNG?raw=true)
![Welcome Screen](https://github.com/jashgopani/Debloat/blob/master/screenshots/debloat2.PNG?raw=true)
![List of Apps](https://github.com/jashgopani/Debloat/blob/master/screenshots/debloat3.PNG?raw=true)
![Uninstalling](https://github.com/jashgopani/Debloat/blob/master/screenshots/debloat4.PNG?raw=true)
![Debloat Complete](https://github.com/jashgopani/Debloat/blob/master/screenshots/debloat5.PNG?raw=true)

## How does it work

The [Bash](https://www.gnu.org/software/bash/manual/html_node/What-is-Bash_003f.html) script uses ` Android Debugging Bridge(ADB)` to get developer privileges on your Android device and hence it does not affect your warranty. To know more about adb, read this [Android Developer Documentation](https://developer.android.com/studio/command-line/adb). 

## Setup and Requirements

> **:information_source:Note:** If you have Android Studio / Android SDK setup on your PC then you already have ADB installed. Just make sure that the adb is added to the _PATH variables_.

  - ADB ([Download & Setup Instructions](https://www.google.com) | For **Windows & Mac** only)
  - Git Bash ([Download](https://gitforwindows.org/) | Only for **Windows** users )
  - _Windows users_ **add adb to your PATH variable**
  - **Enable Developer Options** on your android device. (_Checkout the adb link for the same_)
  - Download this repository / copy the script

## Running the script

> **:information_source:Note:** Adding `./` is important on Windows machines else the script won't run

 1. **Connect** your Android phone to your PC via USB🔌.
 2. Launch terminal on your machine💻
     - If you are on Windows, use `Git Bash` .
     - If you are on Linux / MacOS, use ```terminal```.
 3. **Run the following command**   ``` ./<relative-path>/debloat.sh``` in your terminal. (_`./debloat.sh` in case of current directory_)
 4.  Now follow the instructions on your terminal :)

## Adding / Removing apps

> **:information_source:Note:** If the app isn't present on your device, it won't affect the execution of script. It will just show an error **_app not found on 0_**

> **:warning:Warning:** Do not Uninstall the **Find my device** app on your MIUI phones, else your phone will go in a boot loop on restart and you'll have to erase all your data to use your phone !

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

## FAQs

 - **Why do I need Git to run this script ?**

   _This is a Bash script and Windows doesn't support running bash scripts directly. Hence to execute it you need a terminal that supports bash scripts and `Git Bash` is such a terminal. Another option is setting up the `WSL` on your Windows machine but that is too much work for uninstalling apps !_

 - **What is relative path ?**

   _Relative path is path of the target/Destination file from the current directory.
   For example, if your file _debloat.sh_ is in the **same directory** as your Bash shell, your relative path is `./debloat.sh` where ./ means current directory.  
Have a look at [this](https://desktop.arcgis.com/en/arcmap/10.3/tools/supplement/pathnames-explained-absolute-relative-unc-and-url.htm#GUID-A2D28AFE-2546-489A-8691-A0B2816AA337) article for more details._

  - **How do I get complete name of an app ?**

    _You can checkout the `App Info` section of the application in your device and if you can't find the app package name there, you can install a third party app like [this](https://play.google.com/store/apps/details?id=com.csdroid.pkg&hl=en_IN)_  
  
![Package App Viewer](https://lh3.googleusercontent.com/A1EeCw9BFTMDIfpKC4sHGIkaFOGixT9IBfLy4W70ruZag0sayqM6nzi791hq4ZThYYU=w1366-h667-rw "Package App Viewer")

  - **My Apps are not uninstalled, what is the reason ? What should I do ?**

      _Reconnect your device and re-run the script ! Sometimes, only the updates of the System apps are uninstaled and the app is restored to its factory version; so to uninstall this version , just rerun the script._

  - **How is this different from `Disable` option on my phone ?**
  
      _Disabling apps does not uninstall them. The apps still occupy space in your internal storage ! This script, uninstalls and completely removes the apps from your phone_
     

  ---
  
### **:warning:Disclaimer:** Altough this script works perfectly, the Developer is **NOT RESPONSIBLE** for any damage or misbehaviour on your device.
  
   



