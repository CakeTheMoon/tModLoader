@echo off
cd /D "%~dp0"
set Args=-server -config serverconfig.txt
setlocal EnableDelayedExpansion

set /P steam=Use Steam Server [y]/[n] steam:
if NOT %steam%==y ( goto start )

set Args=%Args% -steam
set /p lobby=Select Lobby Type [f]riends/[p]rivate lobby:
if NOT %lobby%==p ( set Args=%Args% -lobby friends )
if %lobby%==p ( set Args=%Args% -lobby private )

:start
call InstallNetFramework.bat
start dotnet\%VERSIONSEL%\dotnet.exe tModLoader.dll %Args%