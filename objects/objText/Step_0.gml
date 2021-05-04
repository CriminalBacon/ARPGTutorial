/// @description ???

//starts off quick and slows toward the end
lerpProgress += (1 - lerpProgress) / 50;

textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//if space bar is pressed, destroy text box
if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(textMessage);
	//check to see if whole message is shown
	if (textProgress >= _messageLength)
	{
		instance_destroy();
	} else
	{
		//display whole message after 2nd frame
		if (textProgress > 2)
		{
			textProgress = _messageLength;	
		}
	}

}