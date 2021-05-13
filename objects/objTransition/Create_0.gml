/// @description Enums + Setup


enum TRANS_TYPE
{
	SLIDE,
	FADE,
	PUSH,
	STAR,
	WIPE

}

width = RESOLUTION_W
height = RESOLUTION_H
//add 20 to leave the screen black for a few frames before finishing transition
heightHalf = (height * 0.5) + 20;
percent = 0;
leading = OUT;