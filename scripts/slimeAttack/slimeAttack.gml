/// @description ???
 
function slimeAttack(){
	
	//how fast to move
	var _spd = enemySpeed;
	
	//don't move while getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//freeze animation while in mid-air and also afer landing finishes
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	
	//how far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing end of the animation once were nearly done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);  //faces the correct direction
		
		//Commit to move and stop moving if we hit a wall
		if (enemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
			
		}
	
	}
	else
	{
		//leap to position
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	
	}
	


}