@echo off
title Install PhotoGIMP Windows
if not exist "%UserProfile%\AppData\Roaming\GIMP\2.10" mkdir "%UserProfile%\AppData\Roaming\GIMP\2.10"
if not exist "PhotoGIMP.zip" (
    echo You need the "PhotoGIMP.zip". Make sure the file is in the same directory.
    echo Download here: https://github.com/Diolinux/PhotoGIMP/releases/latest
    pause > nul
    exit
)
choice /c yn /m "This will erase all your settings. Continue"
if %ErrorLevel% equ 2 (exit)
echo -------------------------------------------------
tar -xvzf "PhotoGIMP.zip" --strip-components=6 -C "%UserProfile%\AppData\Roaming\GIMP" "PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP"
echo =================================================
echo Finish.
pause > nul
exit
