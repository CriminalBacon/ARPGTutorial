/// @description Updates Sprite
/// @function 
/// @param
function playerAnimateSprite(){
	
	var _totalFrames = sprite_get_number(sprite_index) /4;
	
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);
	
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	// If animation would loop on next game step
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	} else animationEnd = false;

}