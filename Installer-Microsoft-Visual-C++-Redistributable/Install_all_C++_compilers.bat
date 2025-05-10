@echo off

set FILE_PATH=%~dp0
set FILE_NAME=*redist*.exe
set SCRIPTS_PATH=%FILE_PATH%\scripts
set SCRIPT_INSTALL_2005=%SCRIPTS_PATH%\install_2005.bat
set SCRIPT_INSTALL_2008=%SCRIPTS_PATH%\install_2008.bat
set SCRIPT_INSTALL_2010_2022=%SCRIPTS_PATH%\install.bat

dir "%FILE_PATH%" >nul

if errorlevel 1 (
	exit/b 1
)
for %%f in ("%FILE_PATH%\%FILE_NAME%") do (
	echo.
	echo Installing %%~nf

	echo %%~nf | findstr /C:"2005"
	if not errorlevel 1 (
		call "%SCRIPT_INSTALL_2005%" "%%f"
	) else (
	
		echo %%~nf | findstr /c:"2008"
		if not errorlevel 1 ( 
			call "%SCRIPT_INSTALL_2008%" "%%f"
			
		) else ( 
			call "%SCRIPT_INSTALL_2010_2022%" "%%f"
		)
	)
	
	if errorlevel 1 (
		echo ERROR: %%~nf
		echo %errorlevel%
	) else (
		echo OK: %%~nf
	)
	
)
echo Instalation completed