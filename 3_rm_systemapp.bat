@echo off

IF [%apk_name%] == [] set apk_name=app-debug
set apk_signed=%apk_name%_signed
set apk_signed_aligned=%apk_signed%_aligned

set apk_name=%apk_name%.apk
set apk_signed=%apk_signed%.apk
set apk_signed_aligned=%apk_signed_aligned%.apk



adb root
adb shell su -c '"mount -o remount,rw /system"'
adb shell su -c "mount -o remount,rw /system"
adb shell su -c '"rm /system/app/%apk_signed_aligned%"'
adb shell su -c "rm /system/app/%apk_signed_aligned%"





ping 127.0.0.1 -n 5 > .null
del .null
echo Done