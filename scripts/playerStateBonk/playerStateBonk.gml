/// @description
/// @function
/// @param
function playerStateBonk(){

	//Movement
	//moves opposite direction
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	//max is used to make sure it does not go below 0
	moveDistanceRemaining = max(0, moveDistanceRemaining-speedBonk);
	var _collided = playerCollision();
	
	//Update Sprite
	sprite_index = sprPlayerHurt;
	
	//changed to plus 2 to fix the animation, according to YT comment section
	image_index = CARDINAL_DIR + 2;
	
	//change height
	//for explanation watch part 12 @ 19:00
	z = sin(((moveDistanceRemaining /  distanceBonk) * pi)) * distanceBonkHeight;
	
	
	//Change State
	if (moveDistanceRemaining <= 0)
	{
		state = playerStateFree;
	}
	
}