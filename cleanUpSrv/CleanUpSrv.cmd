@echo on

for /f "tokens=1 " %%a in ('dir e:\home\*.* /b') do RD /S /Q "e:\home\%%a\profile\user.pds\Temporary Internet Files" 

for /f "tokens=1 " %%a in ('dir e:\home\*.* /b') do RD /S /Q "e:\home\%%a\Backup\Workspaces" 

del cleanupsrv.cmd /q