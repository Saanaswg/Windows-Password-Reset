@echo off
cls

set system32=c:\windows\system32

if not exist %system32%\utilman.exe.bak (
	echo Password reset not armed. Please run prep.bat from the cmd while using installation media
	pause >nul
	exit >nul
)

set /p user=Enter username of user with password: 

if %user% neq "" (
	net user %user% "" >nul

	cls
	echo Password for %user% has been removed
	
	del %system32%\reset.bat
	move %system32%\utilman.exe c:\users\%user%\appdata\local\temp >nul
	ren %system32%\utilman.exe.bak utilman.exe
	pause >nul
)
exit >nul