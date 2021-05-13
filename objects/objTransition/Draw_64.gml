/// @description Draw effects

//can convert to switch statement
if (type == TRANS_TYPE.SLIDE)
{
	draw_set_color(c_black);
	
	//rectangle moves from top to bottom
	draw_rectangle(0, 0, width, percent * heightHalf, false);
	//rectangle moves up from botton
	draw_rectangle(0, height, width, height - (percent * heightHalf), false);

}

if (type == TRANS_TYPE.FADE)
{
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0, 0, width, height, false);


}
