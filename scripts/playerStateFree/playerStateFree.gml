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
	
	//Activate attack logic
	if (keyAttack)
	{
		state = playerStateAttack;
		stateAttack = attackSlash;
	}
	

	//Activate key logic
	if(keyActivate)
	{
		// 1. Check for entity to activate
		// 2. If there is nothing or there is something but it has no script, then roll
		// 3. otherwise, there is something and it has a script, Activate
		// 4. if the thing we activate is an NPC, make it face towars us
		
		//how far we would have to move 10 pixels in the direction we are facing
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		
		// 1.
		activate = instance_position(x+_activateX, y+_activateY, parEntity);
		
		
		if (activate == noone || activate.entityActivateScript = -1)
		{
			//2.		
			state = playerStateRoll;
			moveDistanceRemaining = distanceRoll;
			
		}
		else 
		{
			//3.
			script_execute_ext(activate.entityActivateScript, activate.entityActivateArgs);
			
					
			//4.
			if (activate.entityNPC)
			{
				with(activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		
		}

		
	}

}