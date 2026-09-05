@echo off

set version=1.8
set gimpVersion=3
set "gimpPath=%appData%\GIMP"

title PhotoGIMP Windows Installer (v%version%)

setlocal enabledelayedexpansion
set "highest="

for /d %%i in ("%gimpPath%\%gimpVersion%.*") do (
    set "v=%%~nxi"
    echo !v!|findstr /r "^%gimpVersion%\.[0-9][0-9]*$" >nul
    if not errorlevel 1 (
        if !v! gtr !highest! set "highest=!v!"
    )
)

if not defined highest set "highest=%gimpVersion%.0"
endlocal && set "gimpVersion=%highest%"

echo PhotoGIMP Windows, a Diolinux/PhotoGIMP installer.
echo Download GIMP in: https://www.gimp.org/downloads/
echo --------------------------------------------------

if exist "%gimpPath%\%gimpVersion%" (goto :exist) else (goto :noExist)

:exist
choice /c yn /m "This will erase your config (%gimpPath%\%gimpVersion%). Continue"
if %errorLevel% equ 2 exit /b

if exist "%gimpPath%\%gimpVersion%-Backup" (
    echo -------------------------------------------------
    choice /c yn /m "A backup exists. Continue"
    if %errorLevel% equ 2 exit /b
)

echo -------------------------------------------------
xcopy "%gimpPath%\%gimpVersion%\" "%gimpPath%\%gimpVersion%-Backup\" /e /y
goto :install

:noExist
choice /c yn /m "Start installation"
if %errorLevel% equ 2 exit /b
goto :install

:install
echo -------------------------------------------------
xcopy ".\photogimp\" "%gimpPath%\%gimpVersion%\" /e /y

echo ##################################################
echo Install finish.
pause > nul
exit /b