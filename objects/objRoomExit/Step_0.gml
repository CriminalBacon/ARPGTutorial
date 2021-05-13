/// @description Cause a room transition

if (instance_exists(objPlayer)) && (position_meeting(objPlayer.x, objPlayer.y, id))
{
	if (!instance_exists(objTransition))
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = objPlayer.direction;
	
		//make sure player is in transition state
		with (objPlayer) state = playerStateTransition;
		roomTransition(TRANS_TYPE.SLIDE, targetRoom);
	
		//destroy instance so not to trigger every instance the player is colliding with it
		instance_destroy();
	}

}