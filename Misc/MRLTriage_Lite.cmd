@echo off
setlocal
cd /d %~dp0

net session >nul 2>&1
if not %ERRORLEVEL%==0 (
	echo This script requires administrative privileges. Right click on file / Run as administrator.
	set /P DUMMY=Press Enter to close this window...
	exit /b
)

echo Starting nvsmi.exe to log GPU events ...
start "" nvsmi.exe

echo Starting WPR trace (max 1 min), press Enter to stop ...
set NAME=MRLTriage_Lite
wpr -cancel >nul 2>&1
wpr -start %NAME%.wprp -filemode
timeout /t 60

set hour=%time:~0,2%
if "%hour:~0,1%" == " "  set hour=0%hour:~1,1%
set TimeStamp=%date:~12,2%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%%time:~6,2%

set ETL=%TimeStamp%_%NAME%.etl
wpr -stop %ETL% -compress -skipPdbGen 
echo %ETL%

echo Flushing the MixedRealityLink autologger ...
logman.exe update MixedRealityLinkLog -fd -ets
if %ERRORLEVEL% neq 0 (
	echo ERROR: Failed to flush MixedRealityLinkLog. ERRORLEVEL=%ERRORLEVEL%
	exit /b %ERRORLEVEL%
)

echo Copying MixedRealityLink ETLs to this folder ...
copy /Y %SystemRoot%\system32\LogFiles\MixedRealityLink.etl* %~dp0
if %ERRORLEVEL% neq 0 (
	echo ERROR: Failed to copy MixedRealityLink ETL files. ERRORLEVEL=%ERRORLEVEL%
	exit /b %ERRORLEVEL%
)

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo %ESC%[92mDone. Send the ETLs from %~dp0 for analysis (*.etl and *.etl.00*).%ESC%[0m

set /P DUMMY=Press Enter to close this window...
endlocal
