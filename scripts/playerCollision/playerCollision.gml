/// @description
/// @function
/// @param
function playerCollision(){
	var _collision = false;
	
	//Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	
	}
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//Verticle Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	
	}
	
	//Verticle Move Commit
	y += vSpeed;
	
	
	
	return _collision;
}