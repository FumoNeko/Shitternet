@ECHO OFF
cd C:\Users\chegu\Desktop
type shitternetlogo.txt  
cd C:\WINDOWS\system324	        
pause
echo THIS PROGRAM WILL RESET THE FOLLOWING TO DEFAULT:
echo WINSOCK, TCP/IP stack, firewall, DNS cache, DNS registration, routing table.
echo \n

:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice


:somewhere

@ECHO OFF
echo Resetting WINSOCK catalog...
netsh winsock reset catalog
echo resetting TCP/IP stack to installation defaults...
netsh int ip reset reset.log
echo resetting windows firewall to installation defaults...
netsh advfirewall reset
echo Flushing DNS cache...
ipconfig /flushdns
echo renewing DNS client registration and refreshing DHCP leases...
ipconfig /registerdns
echo Flushing the routing table...
route /f
echo Done.
@ECHO OFF
pause

echo Do you want to restart your computer? Changes will not be made until a restart.
:choice2
set /P c=Restart your Computer[Y/N]?
if /I "%c%" EQU "Y" goto :restart
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice2
exit

:restart
shutdown /r

:somewhere_else
exit
