@echo off
cd /d %~dp0
set NAME=MRLTriage
::wpr -cancel
wpr -start %NAME%.wprp -filemode
set /P DUMMY=Press Enter to stop tracing...

set hour=%time:~0,2%
if "%hour:~0,1%" == " "  set hour=0%hour:~1,1%
set TimeStamp=%date:~12,2%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%%time:~6,2%

set ETL=%TimeStamp%_%NAME%.etl
wpr -stop %ETL% -compress -skipPdbGen 
echo %ETL%

:: copy unity logs
copy /Y "%LOCALAPPDATA%\Unity\Editor\Editor.log" "%TimeStamp%_%NAME%_Editor.log"

set /P DUMMY=Press Enter to close this window...
