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
		//can't attack if holding something
		if (global.iLifted == noone)
		{
			state = playerStateAttack;
			stateAttack = attackSlash;
		}
	}
	

	//Activate key logic
	if(keyActivate)
	{
		// 1. Check for entity to activate
		// 2. If there is nothing or there is something but it has no script
			//2a.  If we are carrying something, throw it
			//2b.  Otherwise, roll!
		// 3. otherwise, there is something and it has a script, Activate
		// 4. if the thing we activate is an NPC, make it face towars us
		
		//how far we would have to move 10 pixels in the direction we are facing
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		
		// 1.
		var _activateSize = 4;
		var _activateList = ds_list_create();
		
		activate = noone;
		var _entitesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			parEntity,
			false,
			true,
			_activateList,
			true
		);
		
		//if the first instance we find is either our lifted entity or it has no script, try the next one
		while(_entitesFound > 0)
		{
			var _check = _activateList[| --_entitesFound]; 
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
			
		}
		
		ds_list_destroy(_activateList);
		
		if (activate == noone)
		{
			//Throw something if held
			if (global.iLifted != noone)
			{
				playerThrow();
			
			} else //Otherwise, roll!
			{
				state = playerStateRoll;
				moveDistanceRemaining = distanceRoll;
			}
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