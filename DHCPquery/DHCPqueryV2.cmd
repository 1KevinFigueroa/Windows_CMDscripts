
alive /repeat=2 %1>nul
	if NOT %errorlevel% EQU 0 (goto eof)

:DHCPstopped
 sc \\%1 query dhcpserver | findstr /i Running
	if %errorlevel% EQU 0 (Echo %1, DHCP server is Running> %1.dhcp
				goto :eof)
exit
:EOF
exit
