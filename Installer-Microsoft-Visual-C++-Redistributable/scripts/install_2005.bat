

set FILE=%1
for %%f in (%FILE%) do (
	set FILE_PATH=%%~dpf
)

set MSI_PATH=%FILE_PATH%msi_installer
set MSI_FILE=%MSI_PATH%\vcredist.msi

if exist "%MSI_PATH%" (
	rmdir /s /q "%MSI_PATH%"
)
%FILE% /Q /C /T:"%MSI_PATH%" 
msiexec /i "%MSI_FILE%" /qn /norestart 

if errorlevel 1 (
    rmdir /s /q "%MSI_PATH%"
	exit /b 1
) else (
	rmdir /s /q "%MSI_PATH%"
	exit /b 0
)