#!/bin/sh
clear

tail -f bindname.log | while read TARGET
do
./bindx.sh $TARGET
done
