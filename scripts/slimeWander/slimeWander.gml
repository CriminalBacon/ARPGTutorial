/// @description ???
 
function slimeWander(){
	sprite_index = sprMove;
	
	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed) //if enemy constantly runs into wall
	{
		hSpeed = 0;
		vSpeed = 0;
		//End our move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		//set new Target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
			
		}
		
	}
	
	
	//Move towards new destination	
	else	
		{
			timePassed++;
			image_speed = 1.0;
			var _distanceToGo = point_direction(x, y, xTo, yTo);
			var _speedThisFrame = enemySpeed;
			//if we are going to overshoot the destination, just goto destination
			if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
			dir = point_direction(x, y, xTo, yTo);
			hSpeed = lengthdir_x(_speedThisFrame, dir);
			vSpeed = lengthdir_y(_speedThisFrame, dir);
			
			if (hSpeed != 0) image_xscale = sign(hSpeed);
			
			//Collide & move
			//could also just call enemyTileCollision();
			var _collided = enemyTileCollision();
	
		}
}