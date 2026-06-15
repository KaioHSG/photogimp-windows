@echo off

set "gimpVersion=3.2"
set "version=1.7"

title PhotoGIMP Windows Installer (v%version%)

echo PhotoGIMP Windows for GIMP %gimpVersion%
echo Download GIMP in: https://download.gimp.org/gimp/v%gimpVersion%/windows/
echo --------------------------------------------------
if exist "%appData%\GIMP\%gimpVersion%" (goto :nexist) else (goto :exist)

:exist
choice /c yn /m "Start installation"
if %errorLevel% equ 2 exit /b
goto :install

:noExist
choice /c yn /m "This will erase your config (%appData%\GIMP\%gimpVersion%). Continue"
if %errorLevel% equ 2 exit /b
echo -------------------------------------------------
xcopy "%appData%\GIMP\%gimpVersion%\" "%appData%\GIMP\%gimpVersion%-bak\" /s /-y
goto :install

:install
echo -------------------------------------------------
xcopy ".\%gimpVersion%\" "%appData%\GIMP\%gimpVersion%\" /s /y
echo ##################################################
echo Install finish.
pause > nul
exit /b
