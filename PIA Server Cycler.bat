@echo off
cd\Program Files\Private Internet Access
if errorlevel 1 goto error3
setlocal
call :setESC
cls

:reset

echo %ESC%[32mSelect number of servers to switch between (2-5):%ESC%[0m 
set /p ServerNum=

if %ServerNum% NEQ 2 if %ServerNum% NEQ 3 if %ServerNum% NEQ 4 if %ServerNum% NEQ 5 goto error
echo %ESC%[46m---Server List---%ESC%[0m
echo %ESC%[33mus-atlanta, us-florida, us-houston, us-texas, us-washington-dc, us-new-york, us-east, us-chicago, us-denver, us-west, us-las-vegas, us-california, us-seattle, us-silicon-valley, brazil, mexico, bahamas, venezuela, ca-ontario, ca-montreal, ca-toronto, ca-vancouver, greenland, panama, france, luxembourg, de-frankfurt, de-berlin, uk-manchester, uk-london, uk-streaming-optimized, uk-southampton, isle-of-man, netherlands, algeria, andorra, liechtenstein, austria, czech-republic, %ESC%[0m
echo %ESC%[33mThis is not a complete server list, you can check for other server names in PIA%ESC%[0m
if %ServerNum%==2 goto server2
if %ServerNum%==3 goto server3
if %ServerNum%==4 goto server4
if %ServerNum%==5 goto server5

:server2
echo %ESC%[32mSelect server 1:%ESC%[0m
set /p Server1=
echo %ESC%[32mSelect server 2:%ESC%[0m
set /p Server2=
echo %ESC%[32mSet interval between switching servers (in seconds):%ESC%[0m
set /p CycleTime=
goto start

:server3
echo %ESC%[32mSelect server 1:%ESC%[0m
set /p Server1=
echo %ESC%[32mSelect server 2:%ESC%[0m
set /p Server2=
echo %ESC%[32mSelect server 3:%ESC%[0m
set /p Server3=
echo %ESC%[32mSet interval between switching servers (in seconds):%ESC%[0m
set /p CycleTime=
goto start

:server4
echo %ESC%[32mSelect server 1:%ESC%[0m
set /p Server1=
echo %ESC%[32mSelect server 2:%ESC%[0m
set /p Server2=
echo %ESC%[32mSelect server 3:%ESC%[0m
set /p Server3=
echo %ESC%[32mSelect server 4:%ESC%[0m
set /p Server4=
echo %ESC%[32mSet interval between switching servers (in seconds):%ESC%[0m
set /p CycleTime=
goto start

:server5
echo %ESC%[32mSelect server 1:%ESC%[0m
set /p Server1=
echo %ESC%[32mSelect server 2:%ESC%[0m
set /p Server2=
echo %ESC%[32mSelect server 3:%ESC%[0m
set /p Server3=
echo %ESC%[32mSelect server 4:%ESC%[0m
set /p Server4=
echo %ESC%[32mSelect server 5:%ESC%[0m
set /p Server5=
echo %ESC%[32mSet interval between switching servers (in seconds):%ESC%[0m
set /p CycleTime=
goto start

:start
if %ServerNum%==2 goto loop2
if %ServerNum%==3 goto loop3
if %ServerNum%==4 goto loop4
if %ServerNum%==5 goto loop5

:loop2
echo %ESC%[35mConnecting to %Server1% %ESC%[0m
piactl set region %Server1%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server2% %ESC%[0m
piactl set region %Server2%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
goto loop2

:loop3
echo %ESC%[35mConnecting to %Server1% %ESC%[0m
piactl set region %Server1%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server2% %ESC%[0m
piactl set region %Server2%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server3% %ESC%[0m
piactl set region %Server3%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
goto loop3

:loop4
echo %ESC%[35mConnecting to %Server1% %ESC%[0m
piactl set region %Server1%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server2% %ESC%[0m
piactl set region %Server2%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server3% %ESC%[0m
piactl set region %Server3%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server4% %ESC%[0m
piactl set region %Server4%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
goto loop4

:loop5
echo %ESC%[35mConnecting to %Server1% %ESC%[0m
piactl set region %Server1%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server2% %ESC%[0m
piactl set region %Server2%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server3% %ESC%[0m
piactl set region %Server3%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server4% %ESC%[0m
piactl set region %Server4%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
echo %ESC%[35mConnecting to %Server5% %ESC%[0m
piactl set region %Server5%
if errorlevel 1 goto error2
timeout /t %CycleTime% /nobreak
goto loop5

:error
echo %ESC%[31mERROR: Invalid Input%ESC%[0m
echo %ESC%[31mERROR: Invalid Input%ESC%[0m
goto reset

:error2
echo %ESC%[31mERROR: Invalid server was set, PIA returned an error%ESC%[0m
echo %ESC%[31mMake sure that server names are formated properly!%ESC%[0m
goto reset

:error3
echo %ESC%[31mERROR: PIA program folder not found, try renistalling PIA%ESC%[0m
goto reset

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0