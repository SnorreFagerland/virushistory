
#ifndef __COLORS_H__
	#define __COLORS_H__

	#define BLACK   0
	#define RED     1
	#define GREEN   2
	#define YELLOW  3
	#define BLUE    4
	#define MAGENTA 5
	#define CYAN    6
	#define WHITE   7

	void SetFgColor(u8 color);
	void SetBgColor(u8 color);
	void SetColors(u8 bgColor, u8 fgColor);

#endif