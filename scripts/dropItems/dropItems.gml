/// @description dropItems(x, y, [items])
/// @function
/// @param
function dropItems(_x, _y, _fragmentArray){

	var _items = array_length(_fragmentArray);
	
	if(_items > 1)
	{
		//spread out items in a evenly spaced random circle
		var _anglePerItem = 360/_items;
		var _angle = random(360);
		for (var i = 0; i < _items; i++)
		{
			with(instance_create_layer(_x, _y, "Instances", _fragmentArray[i]))
			{
				direction = _angle;
				//creates bigger circle depending on number of items
				spd = 0.75 + (_items * 0.1) + random(0.1);
			}
			
			//spread out in an even circle
			_angle += _anglePerItem;
		}
	
	} else instance_create_layer(_x, _y, "Instances", _fragmentArray[0]);

}