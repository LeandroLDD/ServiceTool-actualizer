@echo off

echo Restore Power saver power plan...
powercfg -duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a

echo Restore Balanced power plan...
powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e

echo Restore High Performance power plan...
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo Restore Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

reg add HKLM\System\CurrentControlSet\Control\Power /v CsEnabled /t REG_DWORD /d 0

reg add HKLM\System\CurrentControlSet\Control\Power /v PlatformAoAcOverride /t REG_DWORD /d 0