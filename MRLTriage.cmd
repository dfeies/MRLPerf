@echo off
cd /d %~dp0
set NAME=MRLTriage
::wpr -cancel
wpr -start %NAME%.wprp -filemode
::timeout /t 12
set /P DUMMY=Hit enter to stop tracing...

set hour=%time:~0,2%
if "%hour:~0,1%" == " "  set hour=0%hour:~1,1%
set TimeStamp=%date:~12,2%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%%time:~6,2%

set ETL=c:\1\%TimeStamp%_%NAME%.etl
wpr -stop %ETL% -compress -skipPdbGen 
echo %ETL%
