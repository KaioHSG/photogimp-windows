@echo off
title Install PhotoGIMP Windows
if not exist "PhotoGIMP.zip" (
    echo You need the "PhotoGIMP.zip". Make sure the file is in the same directory.
    echo Download page: https://github.com/Diolinux/PhotoGIMP/releases/latest
    pause > nul
    exit
)
choice /c yn /m "This will erase your settings (%AppData%\GIMP). Continue"
if %ErrorLevel% equ 2 (exit)
echo -------------------------------------------------
tar -zxvf "PhotoGIMP.zip" -C "%AppData%" --strip-components=5 "PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP"
echo =================================================
echo Finish.
pause > nul
exit
