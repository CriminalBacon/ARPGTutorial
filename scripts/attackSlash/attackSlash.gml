/// @description
/// @function
/// @param
function attackSlash(){
	
	//check to see if the attack has started
	if (sprite_index != sprPlayerAttackSlash)
	{
		sprite_index = sprPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
	}
	
	//update sprite
	playerAnimateSprite();
	
	if(animationEnd)
	{
		state = playerStateFree;
		animationEnd = false;
	}

}