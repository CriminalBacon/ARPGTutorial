/// @description Progress Transition

//You do not have to check if objPlayer exits before using a 'with' statement
//The trailing statements will be skipped if objPlayer does not exist
with (objPlayer) state = playerStateTransition;

if (leading == OUT)
{
	//using min function so we don't overshoot 1
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) //If screen fully obscured
	{
		room_goto(target);
		leading = IN;
	}


} else //leading == IN
{
	//makes sure we don't go below 0
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) //if screen fully revealed
	{
		//return playet to free state
		with (objPlayer) state = playerStateFree;
		instance_destroy();
	}

}
