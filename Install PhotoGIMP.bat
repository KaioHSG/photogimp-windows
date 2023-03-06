@echo off
title Install PhotoGIMP

if not exist "%UserProfile%\AppData\Roaming\GIMP\2.10" (
    echo You need GIMP 2.10. Try opening GIMP so that the necessary files are created.
    pause
    exit
)
if not exist "PhotoGIMP" (
    echo You need the PhotoGIMP folder. Make sure the folder is in the same directory.
    pause
    exit
)
xcopy /e /i /y "PhotoGIMP" "%UserProfile%\AppData\Roaming\GIMP\2.10"
echo.
pause
exit