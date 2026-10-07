
#include <ogcsys.h>
#include <stdio.h>
#include "colors.h"

void SetFgColor(u8 color) {
	printf("\x1b[%u;1m", color + 30);
}

void SetBgColor(u8 color) {
	printf("\x1b[%u;0m", color + 40);
}

void SetColors(u8 bgColor, u8 fgColor) {
	SetBgColor(bgColor);
	SetFgColor(fgColor);
}