/// @description
/// @function
/// @param
function playerStateFree(){

	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	playerCollision();


	//Update Sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	
	} else sprite_index = spriteIdle;

	//resets localFrame when animation is changed
	if (_oldSprite != sprite_index) localFrame = 0;

	//Update image index
	playerAnimateSprite();
	
	//Change state
	if(keyActivate)
	{
		state = playerStateRoll;
		moveDistanceRemaining = distanceRoll;
		
	}

}