/// @description ???

//starts off quick and slows toward the end
lerpProgress += (1 - lerpProgress) / 50;

textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);


//Cycle through responses
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("D"));
responseSelected += (keyDown - keyUp);
var _max = array_length(responses) - 1;

//Wrap around selection
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;


//if space bar is pressed, destroy text box
if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(textMessage);
	//check to see if whole message is shown
	if (textProgress >= _messageLength)
	{
		
		if (responses[0] != -1)
		{
			//running the dialog response system from what called it
			with(originInstance) dialogResponses(other.responseScripts[other.responseSelected]);
		}
		
		
		instance_destroy();
		
		//check to see if there are more text box queued
		if (instance_exists(objTextQueued))
		{
			with(objTextQueued) ticket--;

		}
		else
		{
			//after last textQueued instance, reset state
			with(objPlayer) state = lastState;
		
		}
	} 
	else
	{
		//display whole message after 2nd frame
		if (textProgress > 2)
		{
			textProgress = _messageLength;	
		}
	}

}