@echo off
cls

echo Aquiring list of volumes

echo list volume > diskpart.script
diskpart /s diskpart.script 
del diskpart.script

set /p drive=Enter the drive that Windows is installed on. e.g: D: (Ctrl + C to cancel):  
cls

set system32=%drive%\windows\system32

if exist %system32%\utilman.exe.bak (
	echo Password reset already armed
	pause >nul
	exit
)

icacls %system32%\utilman.exe /reset
ren %system32%\utilman.exe utilman.exe.bak
copy /v .\utilman.exe %system32%\
copy /v .\reset.bat %system32%\

cls
echo Password reset armed. Please remove installation media and reboot.
pause >nul
exit
