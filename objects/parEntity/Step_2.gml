/// @description Entity loop

if (!global.gamePaused)
{
	//depth sort all entities
	depth = -bbox_bottom;
	
	if (lifted) && (instance_exists(objPlayer))
	{
		
		//check to see if player is done lifting
		if (objPlayer.sprite_index != sprPlayerLift)
		{
			x = objPlayer.x;
			y = objPlayer.y;
			z = TOP_OF_HEAD;
			
			//places object in front of player
			depth = objPlayer.depth - 1;
		}
	
	}
	
	if (!lifted)
	{
		//throw lifted object	
		if (thrown)
		{
			//move 3 pixels per frame of throwDistance
			throwDistanceTraveled = min(throwDistanceTraveled+3, throwDistance);
			x = xstart + lengthdir_x(throwDistanceTraveled, direction);
			y = ystart + lengthdir_y(throwDistanceTraveled, direction);
			
			if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
			{
				thrown = false;
				grav = 0.1;
			}
			
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTraveled/throwDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			
			if (throwDistance == throwDistanceTraveled)
			{
				thrown = false;
				if (entityThrowBreak) instance_destroy();
			}
			
		}
		else
		{
			//fall back to earth if above zero Z
			if (z>0)
			{
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0) && (entityThrowBreak) instance_destroy();
			}
			else
			{
				grav = 0.1;
			}
		
		}
		
		
		
	}
	
}

//decay flash
flash = max(flash-0.04, 0);