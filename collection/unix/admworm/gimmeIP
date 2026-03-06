#!/bin/sh
PATH="/usr/bin:/bin:/usr/local/bin/:/usr/sbin/:/sbin"
export PATH

route -n | while read A
do

GW=`echo $A | awk '{printf("%s",$1)}'`

if [ $GW = "0.0.0.0" ]
then 

IFACE=`echo $A | awk '{printf("%s",$8)}'`

ifconfig $IFACE | while read B 
     do
      CMP=`echo $B | awk '{printf("%s",$1)}'`    
      if [ $CMP = "inet" ]
         then
         MYIP=`echo $B | cut -d: -f 2 | awk '{printf("%s",$1)}'`
        # echo "my default iface is $IFACE and my ip is $MYIP"
         echo $MYIP
         exit
      fi    
   done
    
fi
done
