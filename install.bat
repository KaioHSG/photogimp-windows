@echo off
title Install PhotoGIMP Windows
if not exist "%UserProfile%\AppData\Roaming\GIMP\2.10" (
    echo You need GIMP 2.10 or higher. Try opening GIMP so that the necessary files are created.
    pause > nul
    exit
)
if not exist "PhotoGIMP" (
    echo You need the PhotoGIMP folder. Make sure the folder is in the same directory.
    pause > nul
    exit
)
choice /c yn /m "This will erase all your settings. Continue"
if %ErrorLevel% equ 2 (exit)
echo -------------------------------------------------
xcopy /e /y "PhotoGIMP" "%UserProfile%\AppData\Roaming\GIMP\2.10"
echo =================================================
echo Press any key to exit...
pause > nul
exit