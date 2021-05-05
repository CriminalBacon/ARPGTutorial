/// @description
/// @function
/// @param
function newTextBox(_message, _background){
	
	var _obj;

	if(instance_exists(objText)) _obj = objTextQueued; else _obj = objText;
	
	with(instance_create_layer(0, 0, "Instances", _obj))
	{
		textMessage = _message;
		
		// grab instance id of what object is calling function
		if(instance_exists(other)) originInstance = other.id else originInstance = noone;
		background = is_undefined(_background) ? 1 : _background;
		
	}
	
	with(objPlayer)
	{
		if (state != playerStateLocked)
		{
			lastState = state;
			state = playerStateLocked;
		}
	}
}