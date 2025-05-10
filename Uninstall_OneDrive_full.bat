@echo off
setlocal

set COMMAND=%1

echo [+] Cerrando procesos de OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1

echo [+] Desinstalando OneDrive
"%systemroot%\syswow64\OneDriveSetup.exe" /uninstall

echo [+] Eliminando carpetas residuales...
rd "%UserProfile%\OneDrive" /Q /S >nul 2>&1
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S >nul 2>&1
rd "%ProgramData%\Microsoft OneDrive" /Q /S >nul 2>&1

echo OneDrive eliminado exitosamente

if NOT "%COMMAND%"=="/s" (
pause
)

endlocal