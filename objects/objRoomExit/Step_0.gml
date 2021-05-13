/// @description Cause a room transition

if (instance_exists(objPlayer)) && (position_meeting(objPlayer.x, objPlayer.y, id))
{
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = objPlayer.direction;
	
	room_goto(targetRoom);
	
	//destroy instance so not to trigger every instance the player is colliding with it
	instance_destroy();


}