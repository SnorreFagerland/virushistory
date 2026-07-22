all: virus test dump

virus: virus.asm
	nasm -f bin -O2 $< -o $@ -DLINUX=`uname -r|sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'`
	chmod +x virus
	readelf -l virus

dump: dump.c
	@gcc -Wall -O2 $< -o $@
	@hexprint virus
	@ndisasm -b32 virus|sed 's/^000000//g'|sed 's/ byte//g'|	\
		sed 's/     \([a-z]\)/\1/g'|pr --columns=2 -t
	@./dump

test: virus 
	-@mkdir test
	-@cd test&&>1&&>2&&>long_file_name&&	\
	(../virus;ls -al|grep -v ^d;cd ..)
	-@rm -rf test

clean:
	-@rm -f dump virus

.PHONY: all clean
