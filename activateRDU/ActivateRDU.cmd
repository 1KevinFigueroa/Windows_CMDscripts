@echo off
:: GA 12092004 v1
rem This script will add wmtp\domain users to "Remote Desktop Users" group
rem in order for WMTP user will be able to GRAS and use Remote Desktop from
rem remote location.  User will be granted interactive logon rights to control
rem WMTP workstation.




set domain=wmtp.ml.com

for /f "tokens=1-9 delims=. " %%a in ('echo %1') DO SET ZHostname=%%a


(
@ECHO net localgroup "Remote Desktop Users" ^| FINDSTR /I "WMTP\Domain" 
@ECHO 	if not ^%%errorlevel^%% equ 0 ^(net localgroup "Remote Desktop Users" "wmtp\domain users" /ADD ^> c:\windows\system32\RDU.LOG
@ECHO  ---------------------------------- >> c:\WINDOWS\SYSTEM32\rdu.usr ^>^> c:\windows\system32\RDU.LOG
@ECHO 				net localgroup "Remote Desktop Users" "WMTP\DOMAIN USERS" /ADD ^>> c:\windows\system32\RDU.LOG
@ECHO 				@echo ---------------------------------- ^>^> c:\windows\system32\RDU.LOG
@ECHO 				net localgroup "Remote Desktop Users"    ^>^> c:\windows\system32\RDU.LOG
@ECHO 				@echo ---------------------------------- ^>^> c:\windows\system32\RDU.LOG
@ECHO 				^)
@ECHO  del /q %0*.cmd
@ECHO  del /q %0 

 ) >%1.cmd

echo.
echo Requirements: You need to have Admin access to WMTP workstation
echo to successfully grant WMTP user access to Branch WMTP workstation . . .
echo.
echo.
echo Note: Currently adding wmtp\domain users to %zhostname% . . .

 PSEXEC \\%zHostname%.%DOMAIN% -c -d %1.cmd 2>%1
	FINDSTR /I %1 %1

	del /q %1
	del /q %1.cmd

if exist \\%zHostname%.%DOMAIN%\C$\WINDOWS\SYSTEM32\%1.cmd DEL /Q \\%zHostname%.%DOMAIN%\C$\WINDOWS\SYSTEM32\%1.cmd 