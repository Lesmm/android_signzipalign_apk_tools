@echo off


IF [%build_dir%] == [] set build_dir=..
IF [%apk_name%] == [] set apk_name=app-debug
set apk_signed=%apk_name%_signed
set apk_signed_aligned=%apk_signed%_aligned

set apk_name=%build_dir%\%apk_name%.apk
set apk_signed=%build_dir%\%apk_signed%.apk
set apk_signed_aligned=%build_dir%\%apk_signed_aligned%.apk

echo %apk_name%
echo %apk_signed%
echo %apk_signed_aligned%





adb root
adb shell su -c '"mount -o remount,rw /system"'
adb shell su -c "mount -o remount,rw /system"
adb push %apk_signed_aligned% /system/app/





ping 127.0.0.1 -n 5 > .null
del .null
echo Done