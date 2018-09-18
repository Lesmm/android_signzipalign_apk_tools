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





del %apk_signed%
del %apk_signed_aligned%

java -jar signapk.jar platform.x509.pem platform.pk8 %apk_name% %apk_signed%

zipalign.exe -v 4 %apk_signed% %apk_signed_aligned%

zipalign.exe -c -v 4 %apk_signed_aligned%





ping 127.0.0.1 -n 5 > .null
del .null
echo Done