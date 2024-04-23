date /t > y:\NodiskSpace.log
time /t >> y:\NodiskSpace.log

for /f "tokens=1 delims= " %%a in (NoDiskSpace.txt) do PSEXEC \\%%a -c -d CleanUpSrv.cmd