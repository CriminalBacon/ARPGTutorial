/// @description
/// @function
/// @param
function MACROS(){
	#macro FRAME_RATE 60
	#macro TILE_SIZE 16
	
	//converts degrees (0-360) into a number (0-3)
	#macro CARDINAL_DIR round(direction/90)
	
	#macro ROOM_START rmVillage
	#macro RESOLUTION_W 320
	#macro RESOLUTION_H 180
	
	//Transition macros
	#macro TRANSITION_SPEED 0.02
	#macro OUT 0
	#macro IN 1
	
	//Lifting
	#macro TOP_OF_HEAD 13
	
	enum ENEMYSTATE
	{
		IDLE,
		WANDER,
		CHASE,
		ATTACK,
		HURT,
		DIE,
		WAIT
	}
	
}