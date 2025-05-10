@echo off
:: ——— Checkeo de permisos ———
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Solicitando permisos de administrador...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:: ————————————————————


setlocal

set COMMAND=%1
set SCRIPT_PATH=%~dp0

echo [+] Desactivando servicios de Windows Update...
call "%SCRIPT_PATH%DisableService.bat" wuauserv >nul
call "%SCRIPT_PATH%DisableService.bat" UsoSvc >nul

echo [+] Editando registros...
regedit /s "%SCRIPT_PATH%reg_disableAutoUpdate"

echo ---------------------------------------------------
echo     Windows Update deshabilitado exitosamente
echo ---------------------------------------------------

if NOT "%COMMAND%"=="/s" (
	pause
)

endlocal