@echo off
set version=1.4
title PhotoGIMP Windows Installer v%version%
echo PhotoGIMP Windows Installer v%version%
if exist "%AppData%\GIMP" (
    echo --------------------------------------------------
    choice /c yn /m "This will erase your settings (%AppData%\GIMP). Continue"
    if %ErrorLevel% equ 2 (exit)
)
ping /n 1 github.com > nul
if %errorLevel% neq 0 (
    if not exist "photogimp.zip  " (
        echo ##################################################
        echo No server connection. Please check your internet connection and try again.
        pause > nul
        exit
    )
    goto :install
)
curl -s https://api.github.com/repos/Diolinux/PhotoGIMP/releases/latest > %temp%\latest-release.json
for /f "tokens=3 delims=:" %%A in ('findstr /i "browser_download_url" %temp%\latest-release.json') do set url=https:%%A
del /q "%temp%\latest-release.json"
if exist "photogimp.zip  " (
    del /q "photogimp.zip  "
)
echo --------------------------------------------------
curl -L -o "photogimp.zip  " %url%

:install
if not exist "%AppData%\GIMP" (
    mkdir "%AppData%\GIMP"
)
echo -------------------------------------------------
tar -zxvf "photogimp.zip  " -C "%AppData%/GIMP" --strip-components=6 "PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP/*"
echo ##################################################
echo Install finish.
pause > nul
exit
