/// @description
/// @function
/// @param
function playerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	//Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	
	}
	
	//Horizontal entities
	//get entities that are in the spot we want to move to
	var _entityCount = instance_position_list(x + hSpeed, y, parEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0)
	{
		//get first entity of list could also use ds_list_find_value(_entityList,0)
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			//If moving left, move one pixel to right of bounding box of what we collide with
			if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right + 1;
			//if moving right, move one pixel to the left
			else _snapX = _entityCheck.bbox_left-1;
			
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			//we found one collision, so no need to go through the rest of the list
			_entityCount = 0;
		}
		
		//removes first entry in list
		ds_list_delete(_entityList, 0);
		_entityCount--;
		
	}
	
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//clear list between axis
	ds_list_clear(_entityList)
	
	//Verticle Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	
	}
	
	
	//Verticle entities
	//get entities that are in the spot we want to move to
	var _entityCount = instance_position_list(x, y + vSpeed, parEntity, _entityList, false);
	var _snapY;
	
	while(_entityCount > 0)
	{
		//get first entity of list could also use ds_list_find_value(_entityList,0)
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true)
		{
			//Move as close as we can
			//If moving up, move one pixel to bottom of bounding box of what we collide with
			if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom + 1;
			//if moving down, move one pixel up
			else _snapY = _entityCheck.bbox_top-1;
			
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			//we found one collision, so no need to go through the rest of the list
			_entityCount = 0;
		}
		
		//removes first entry in list
		ds_list_delete(_entityList, 0);
		_entityCount--;
		
	}
	
	
	//Verticle Move Commit
	y += vSpeed;
	
	//need to explicity destroy list or it will remain in memory.
	ds_list_destroy(_entityList);
	
	return _collision;
}