#!/bin/sh
while true
 do
  CLASSB=`./randb`
  sleep 60
  killall -9 bind 1>>/dev/null 2>>/dev/null 3>>/dev/null 
  echo >bindname.log
  ./pscan $CLASSB 53
done
