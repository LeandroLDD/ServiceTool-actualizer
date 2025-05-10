@echo off
setlocal

set serviceName=%~1

if "%serviceName%"=="" (
	echo serviceName cannot be empty
	exit /b 1
)

sc stop "%serviceName%" >nul
sc config "%serviceName%" start=disabled >nul
sc failure "%serviceName%" actions=/// reset=0 >nul

endlocal