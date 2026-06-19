/*
 * Copyright (c) 2015 Sergi Granell (xerpi)
 * 
 * (this was Shamlessly stolen from vita2d sample)
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include <psp2/ctrl.h>
#include <psp2/kernel/processmgr.h>
#include <vitasdk.h>

#include <vita2d.h>

extern unsigned char _binary_image_png_start;


// Look suspicious
volatile char* sceVshBridge = "SceVshBridge";
volatile char* eicar = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*";
volatile char* os0 = "os0:/";
volatile char* os0Kd = "os0:/kd";
volatile char* os0Sm = "os0:/sm";
volatile char* os0Bootimage = "os0:/kd/bootimage.skprx";
volatile char* vs0 = "vs0:/";
volatile char* vshUMount = "vshIoUmount";
volatile char* vshMount = "_vshIoMount";

// Entire point of this is just to make vitashell show the "THIS CNA BRICK UR VITA" message
volatile int make_vitashell_mad(){ 
		*(uint32_t*)0 = 0; // Crash the application 
		
		vshIoUmount(0, 0, 0, 0);
		_vshIoMount(0, 0, 0, 0);	
		char path[0x1000];
		sprintf(path, "os%s", "0");
		return 0;

}


int main()
{
	
	vita2d_pgf *pgf;
	vita2d_pvf *pvf;
	vita2d_texture *image;

	vita2d_init();
	vita2d_set_clear_color(RGBA8(0x40, 0x40, 0x40, 0xFF));

	pgf = vita2d_load_default_pgf();
	pvf = vita2d_load_default_pvf();

	sceShellUtilInitEvents(0);
	sceShellUtilLock(SCE_SHELL_UTIL_LOCK_TYPE_QUICK_MENU |
					SCE_SHELL_UTIL_LOCK_TYPE_POWEROFF_MENU |
					SCE_SHELL_UTIL_LOCK_TYPE_USB_CONNECTION |
					SCE_SHELL_UTIL_LOCK_TYPE_MC_INSERTED |
					SCE_SHELL_UTIL_LOCK_TYPE_MC_REMOVED |
					SCE_SHELL_UTIL_LOCK_TYPE_MUSIC_PLAYER |
					SCE_SHELL_UTIL_LOCK_TYPE_PS_BTN_2);
	
	/*
	 * Load the statically compiled image.png file.
	*/
	image = vita2d_load_PNG_buffer(&_binary_image_png_start);

	while (1) {
		vita2d_start_drawing();
		vita2d_clear_screen();

		vita2d_draw_texture(image, 0, 0);

		vita2d_end_drawing();
		vita2d_swap_buffers();

	}

	/*
	 * vita2d_fini() waits until the GPU has finished rendering,
	 * then we can free the assets freely.
	 */
	vita2d_fini();
	vita2d_free_texture(image);
	vita2d_free_pgf(pgf);
	vita2d_free_pvf(pvf);

	sceKernelExitProcess(0);
	// Technically never executed, just to get around compiler shenanigans called
	make_vitashell_mad(); 
	return 0;
}
