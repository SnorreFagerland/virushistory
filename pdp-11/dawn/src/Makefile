DIST=ftp://minnie.tuhs.org/pub/PDP-11/Sims/Apout/UnixBins
ROOT=v5bins.tar.gz
APOUT_ROOT=V5

all: virus

dv: dv.c
	cc -O2 -s dv.c -o dv

$(ROOT):
	wget $(DIST)/$(ROOT)

V5: $(ROOT)
	tar zxvf $(ROOT)

virus: V5 dv virus.s
	export APOUT_ROOT=$(APOUT_ROOT) &&	\
	./apout V5/bin/as virus.s &&	\
	./apout V5/bin/strip a.out
	mv a.out virus
	./dv

clean:
	-@rm -f virus dv
	-@rm -rf V5
