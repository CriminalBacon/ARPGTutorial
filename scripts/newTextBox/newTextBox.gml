/// @description
/// @function
/// @param
function newTextBox(_message, _background, _responseArray){
	
	var _obj;

	if(instance_exists(objText)) _obj = objTextQueued; else _obj = objText;
	
	with(instance_create_layer(0, 0, "Instances", _obj))
	{
		textMessage = _message;
		
		// grab instance id of what object is calling function
		if(instance_exists(other)) originInstance = other.id else originInstance = noone;
		background = is_undefined(_background) ? 1 : _background;
		
		//check to see if responseArray is passed
		if (!is_undefined(_responseArray))
		{
			//Trim markers from responses
			responses = _responseArray;
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				//gets number from responses
				responseScripts[i] = real(string_copy(responses[i], 1, _markerPosition-1));
				
				//gets response string without number
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			
				breakpoint = 10;
				
			}
		}
		else
		{
			//There are no responses
			responses = [-1];
			responseScripts = [-1]
		}
		
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