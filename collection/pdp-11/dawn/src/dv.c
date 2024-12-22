#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv)
{
	int	h, i, t;
	char	b[1024];
	h = open("virus", 0);
	if (h < 0)
		return 2;
	read(h, b, 16);
	t = *((unsigned short*)(b + 2));
	printf("jmp 0f; 0: / size is %d bytes\n", t - 4);
	read(h, b, t);
	close(h);
	h = 0;
	for (i = 4; i < t; i+= 2) {
		printf("%06o", *((unsigned short*)(b + i)));
		if (h != 7 && i != t-2) {
			putchar(';');
			h++;
		} else {
			putchar('\n');
			h = 0;
		}		
	}
	printf(".bss\nbss:.=.+20.\n");
	return 0;
}
