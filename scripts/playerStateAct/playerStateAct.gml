/// @description
/// @function
/// @param
function playerStateAct(){

	//update Sprite
	playerAnimateSprite();
	
	if(animationEnd)
	{
		state = playerStateFree;
		animationEnd = false;
		if(animationEndScript != -1)
		{
			script_execute(animationEndScript);
			//after end script is run, set it back to -1
			animationEndScript = -1;
		}
	}
}