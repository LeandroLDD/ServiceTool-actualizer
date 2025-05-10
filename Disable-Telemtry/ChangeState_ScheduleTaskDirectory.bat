@echo off
setlocal enabledelayedexpansion

set directoryTaskName=%~1
set taskState=%2

if "%directoryTaskName%"=="" (
	echo Enter a Directory Schedule task
	exit /b 1
)

if /i not "%taskState%"=="disable" if /i not "%taskState%"=="enable" (
	echo Error selec: disable or enable
	exit /b 1
)

for /f "tokens=1* delims=\" %%A in ('schtasks /query /fo LIST ^| find "%directoryTaskName%"') do (
	set "line=%%B"
	set "task=!line!"
	
	schtasks /change /tn "!task!" /%taskState%
)


endlocal