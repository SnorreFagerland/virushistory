
#include <stdarg.h>
#include <stdlib.h>
#include <unistd.h>
#include <ogc/machine/processor.h>

#define HW_GPIO1OUT				0x0D8000E0
#define HW_GPIO1IN				0x0D8000E8

enum {
		GP_EEP_CS = 0x000400,
		GP_EEP_CLK = 0x000800,
		GP_EEP_MOSI = 0x001000,
		GP_EEP_MISO = 0x002000
};
#define eeprom_delay() usleep(5)

static void seeprom_send_bits(int b, int bits) {
		while (bits--) {
				if (b & (1 << bits))
						mask32(HW_GPIO1OUT, 0, GP_EEP_MOSI);
				else
						mask32(HW_GPIO1OUT, GP_EEP_MOSI, 0);
				eeprom_delay();
				mask32(HW_GPIO1OUT, 0, GP_EEP_CLK);
				eeprom_delay();
				mask32(HW_GPIO1OUT, GP_EEP_CLK, 0);
				eeprom_delay();
		}
}

static int seeprom_recv_bits(int bits) {
		int res = 0;
		while (bits--) {
				res <<= 1;
				mask32(HW_GPIO1OUT, 0, GP_EEP_CLK);
				eeprom_delay();
				mask32(HW_GPIO1OUT, GP_EEP_CLK, 0);
				eeprom_delay();
				res |= !!(read32(HW_GPIO1IN) & GP_EEP_MISO);
		}
		return res;
}


int seeprom_write(const void *src, unsigned int offset, unsigned int size) {
		unsigned int i;
		const u8* ptr = (const u8*)src;
		u16 send;
		u32 level;

		if (offset&1 || size&1)
				return -1;

		offset>>=1;
		size>>=1;

		// don't interrupt us, this is srs bsns
		_CPU_ISR_Disable(level);

		mask32(HW_GPIO1OUT, GP_EEP_CLK, 0);
		mask32(HW_GPIO1OUT, GP_EEP_CS, 0);
		eeprom_delay();

		// EWEN - Enable programming commands
		mask32(HW_GPIO1OUT, 0, GP_EEP_CS);
		seeprom_send_bits(0x4FF, 11);
		mask32(HW_GPIO1OUT, GP_EEP_CS, 0);
		eeprom_delay();

		for (i = 0; i < size; i++) {
				send = (ptr[0]<<8) | ptr[1];
				ptr += 2;
				// start command cycle
				mask32(HW_GPIO1OUT, 0, GP_EEP_CS);
				// send command + address
				 seeprom_send_bits((0x500 | (offset + i)), 11);
				 // send data
				seeprom_send_bits(send, 16);
				// end of command cycle
				mask32(HW_GPIO1OUT, GP_EEP_CS, 0);
				eeprom_delay();

				// wait for ready (write cycle is self-timed so no clocking needed)
				mask32(HW_GPIO1OUT, 0, GP_EEP_CS);
				do {
					eeprom_delay();
				} while (!(read32(HW_GPIO1IN) & GP_EEP_MISO));

				mask32(HW_GPIO1OUT, GP_EEP_CS, 0);
				eeprom_delay();
		}

		// EWDS - Disable programming commands
		mask32(HW_GPIO1OUT, 0, GP_EEP_CS);
		seeprom_send_bits(0x400, 11);
		mask32(HW_GPIO1OUT, GP_EEP_CS, 0);
		eeprom_delay();

		_CPU_ISR_Restore(level);

		return size;
}

void set_korean(int set)
{
		u8 korean_key[16] = {0x63, 0xb8, 0x2b, 0xb4, 0xf4, 0x61, 0x4e, 0x2e, 0x13, 0xf2, 0xfe, 0xfb, 0xba, 0x4c, 0x9b, 0x7e};
		u8 null_key[16] = {0};
		seeprom_write(set ? korean_key : null_key, 0x74, 16);
}