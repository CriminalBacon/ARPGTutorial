/// @description

if (!global.gamePaused)
{
	
	//Bounce
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed);
		if  (bounce > pi)
		{
			bounce -= pi;
			//reduces bounce height by 60%
			bounceHeight *= 0.6;
			bounceCount--;
			
		}
		//only return positive numbers to create a normal bounce
		z = abs(sin(bounce)) * bounceHeight;
	
	}
	else z = 0;
	
	//Deteriorate
	deteriorate++;
	if(deteriorate > deteriorateAfter)
	{
		image_alpha -= 1/deteriorateTime;
		if (image_alpha <= 0) instance_destroy();
	
	}
	
	//Friction
	fric = 0.05;
	//comes to a halt much quicker when object is on ground
	if (z == 0) fric = 0.10;
	
	//move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	//check for collision and set speed to 0
	if(tilemap_get_at_pixel(collisionMap, x, y) > 0) spd = 0;
	
	spd = max(spd-fric, 0);

}
