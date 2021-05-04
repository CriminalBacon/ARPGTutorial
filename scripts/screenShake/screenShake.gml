/// @description	
/// @function		screenShake(_magnitude, _frames)
/// @param			{real}	_magnitude					sets the strength of the shake (distance range)
/// @param			{real}	_frames						sets the length of the shake in frames (60 = 1sec)

function screenShake(_magnitude, _frames){
	with(global.iCamera)
	{
		//will not add a new screen shake if it is smaller than the screen shake already in affect
		if(_magnitude > shakeRemain)
		{
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _frames;
			
		}
	}
}