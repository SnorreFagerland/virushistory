#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main()
{
	int		h = open("virus", 0), l = lseek(h, 0, 2), i, k;
	unsigned char	b[l];

	if (h < 0 || l < 0 || lseek(h, 0, 0) != 0 || read(h, b, l) !=l)
		return 2;
	close(h);

	printf("Size is %d\n", l);
	printf(" H");for (i = 0; i < l; i++)printf("%x", b[i] >> 4);putchar('\n');
	printf("NL");for (i = 0; i < l; i++)printf("%x", b[i] & 15);putchar('\n');
	for (k = 0; k <= 7; k++) {
		printf("%d ", k);
		for (i = 0; i < l; i++) {
			putchar((b[i] & (1 << k)) > 0 ? '*' : ' ');
		}
		putchar('\n');
	}
	return 0;
}
