/// @description
/// @function
/// @param
function playerThrow(){
	
	with(global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		
		z = TOP_OF_HEAD;
		throwPeakHeight = z + 10;
		throwDistance = entityThrowDistance;
		throwDistanceTraveled = 0;
		
		//start arc further on, since the starting point is the top of the character
		throwStartPercent = (TOP_OF_HEAD/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		
		//inherit players direction
		direction = other.direction;
		
		//store original position of object before we start to throw it
		xstart = x;
		ystart = y;
	
	}
	
	playerActOutAnimation(sprPlayerLift);
	
	// reset iLifted
	global.iLifted = noone;
}