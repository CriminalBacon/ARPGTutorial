/// @description Carry out an animation and optionally carry out a script when the animation ends
/// @function
/// @param
function playerActOutAnimation(_sprite, _endScript)
{
	state = playerStateAct;
	sprite_index = _sprite;
	
	if (!is_undefined(_endScript))
	{
		animationEndScript = _endScript;
		
	}
	
	localFrame = 0;
	image_index = 0;
	
	//called to make sure player is facing the correct direction
	playerAnimateSprite();

}