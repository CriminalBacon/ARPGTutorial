/// @description Pause the game

if (keyboard_check_pressed(vk_escape))
{
	//toggles boolean
	global.gamePaused = !global.gamePaused;

	if (global.gamePaused)
	{
		// selects every object
		with(all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	}
	else 
	{
		with(all)
		{
			image_speed = gamePausedImageSpeed;
		}
	}
}