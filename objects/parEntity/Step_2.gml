/// @description Entity loop

if (!global.gamePaused)
{
	//depth sort all entities
	depth = -bbox_bottom;
}

//decay flash
flash = max(flash-0.04, 0);