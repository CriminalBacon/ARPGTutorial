/// @description
/// @function
/// @param
function activateLiftable(_id)
{
	if(global.iLifted == noone)
	{
		playerActOutAnimation(sprPlayerLift);
		
		global.iLifted = _id;
		
		with(global.iLifted)
		{
			lifted = true;
			persistent = true;
		
		}
	}

}