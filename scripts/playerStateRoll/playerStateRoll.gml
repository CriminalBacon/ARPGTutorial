/// @description
/// @function
/// @param
function playerStateRoll(){

	//Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	//max is used to make sure it does not go below 0
	moveDistanceRemaining = max(0, moveDistanceRemaining-speedRoll);
	var _collided = playerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	
	
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames), _totalFrames-1);
	
	//Change State
	if (moveDistanceRemaining <= 0)
	{
		state = playerStateFree;
	}
	
	if(_collided)
	{
		state = playerStateBonk;
		moveDistanceRemaining = distanceBonk;
		screenShake(2, 30);
	}
	
}