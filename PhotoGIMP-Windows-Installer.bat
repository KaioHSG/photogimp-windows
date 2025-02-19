@echo off
set "gimpVersion=2.10"
set "version=1.5"
title PhotoGIMP Windows Installer v%version%
echo PhotoGIMP Windows Installer v%version%
if exist "%appData%\GIMP\%gimpVersion%" (
    echo --------------------------------------------------
    choice /c yn /m "This will erase your config (%appData%\GIMP\%gimpVersion%). Continue"
    if %ErrorLevel% equ 2 (exit)
) else (mkdir "%appData%\GIMP\%gimpVersion%")
ping /n 1 github.com > nul
if %errorLevel% neq 0 (
    if not exist "PhotoGIMP.zip" (
        echo ##################################################
        echo No server connection. Please check your internet connection and try again.
        pause > nul
        exit
    )
    goto :install
)
curl -s https://api.github.com/repos/Diolinux/PhotoGIMP/releases/latest > %temp%\latest-release.json
for /f "tokens=3 delims=:" %%a in ('findstr /i "browser_download_url" %temp%\latest-release.json') do set "url=https:%%a"
del /q "%temp%\latest-release.json"
if exist "PhotoGIMP.zip" (del /q "PhotoGIMP.zip")
echo --------------------------------------------------
curl -L -o "PhotoGIMP.zip" %url%

:install
echo -------------------------------------------------
tar -zxvf "PhotoGIMP.zip" -C "%appData%/GIMP/%gimpVersion%" --strip-components=7 "PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP"
echo ##################################################
echo Install finish.
pause > nul
exit
