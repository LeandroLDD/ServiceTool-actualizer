@echo off
setlocal

::COMMANDS
::/s "instlación desatendida"

set SCRIPT_PATH=%~dp0
set COMMAND=%~1
set FirstServiceDisabled=DiagTrack
set SecondServiceDisabled=dmwappushservice
set regTelemtry=reg_AllowTelemetry_disabled


echo [+] Desactivando servicios de telemetria...
::1. Desactivar servicio experiencias de usuario y telemetria asociadas
call %SCRIPT_PATH%DisableService.bat %FirstServiceDisabled% >nul

::2. Desactivar servicio WAP
call %SCRIPT_PATH%DisableService.bat %SecondServiceDisabled%



echo [+] Aplicando registros para configurar telemetria
::3. Añadir AllowTelemtry con hexadecimal en 0
regedit /s "%SCRIPT_PATH%%regTelemetry%



echo [+] Deshabilitando tareas programas de telemetria
::4. Deshabilitar tareas programadas de "Application Experience" y "Costumer Experience Improvement program"

call %SCRIPT_PATH%ChangeState_ScheduleTaskDirectory "Application Experience\" disable >nul

call %SCRIPT_PATH%ChangeState_ScheduleTaskDirectory "Customer Experience Improvement Program\" disable >nul

echo La telemetria fue deshablitada correctamente
if not "%COMMAND%"=="/s" (
	pause
)

endlocal